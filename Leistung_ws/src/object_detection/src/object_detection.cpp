#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <cv.h>
#include <highgui.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <sensor_msgs/LaserScan.h>
#include <cmath>
#include <tf/transform_listener.h>
#include <tf/message_filter.h>
#include <message_filters/subscriber.h>
#include <laser_geometry/laser_geometry.h>
#include <geometry_msgs/Point.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CompressedImage.h>
#include <sensor_msgs/PointCloud.h>
#include <object_detection/RobotPose.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;
using namespace sensor_msgs;
namespace enc = sensor_msgs::image_encodings;
RNG rng(12345);
int flag = 0;


class LaserScanToPointCloud{

public:

    ros::NodeHandle n_;
    ros::Subscriber pixel_sub_;
    ros::Publisher pose_pub_;
    ros::Publisher vel_pub_;
    laser_geometry::LaserProjection projector_;
    tf::TransformListener listener_;

    message_filters::Subscriber<sensor_msgs::LaserScan> laser_sub_;

    tf::MessageFilter<sensor_msgs::LaserScan> laser_notifier_;

    double a, x_robot, y_robot, theta, p_pixel_1, p_pixel_2;
    const int bbx_threshold = 15000;
    geometry_msgs::Twist velocity;


    LaserScanToPointCloud(ros::NodeHandle n) :
        n_(n),
        laser_sub_(n_, "/scan", 10),
        laser_notifier_(laser_sub_,listener_, "/base_link", 10)
    {

        ROS_INFO("INITIAL: %d",flag);
        laser_notifier_.registerCallback(
                    boost::bind(&LaserScanToPointCloud::laserCallback, this, _1));
        laser_notifier_.setTolerance(ros::Duration(0.01));
        //scan_pub_ = n_.advertise<sensor_msgs::PointCloud>("/my_cloud",1);
        pixel_sub_ = n_.subscribe("/camera/rgb/image_rect_color/compressed", 10, &LaserScanToPointCloud::color_detection, this);

        pose_pub_=n_.advertise<object_detection::RobotPose>("/robot_pose",10);
        vel_pub_=n_.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/navi",10);

    }


    void laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan_in)
    {
        double x_1, y_1, x_2, y_2, d_between_pillars, angle, depth1, depth2;
        sensor_msgs::PointCloud cloud;
        try
        {
            projector_.transformLaserScanToPointCloud("/base_link", *scan_in, cloud, listener_);
        }
        catch (tf::TransformException& e)
        {
            std::cout << e.what();
            return;
        }

        // Do something with cloud.
        for (int i=0; i<cloud.channels[0].values.size(); i++)
        {
            if (cloud.channels[0].values[i] == (640.0 - p_pixel_1))
            {
                x_1 = -cloud.points[i].y;
                y_1 = cloud.points[i].x;
                //ROS_INFO("x1: %f, y1: %f", x_1, y_1);
            }

            if (cloud.channels[0].values[i] == (640.0 - p_pixel_2))
            {
                x_2 = -cloud.points[i].y;
                y_2 = cloud.points[i].x;
                //ROS_INFO("x2: %f, y2: %f", x_2, y_2);
            }
        }

        //d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2)) + 0.05;
        d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2));
        //a = 4 * (d_between_pillars + 0.028 * 2);
        a = 4 * (d_between_pillars);
        //ROS_INFO("Distance between two pillars: %f", d_between_pillars);
        //ROS_INFO("The value of 'a' is: %f", a);

        depth1 = sqrt(pow(x_1, 2) + pow(y_1, 2));
        depth2 = sqrt(pow(x_2, 2) + pow(y_2, 2));

        //double d1 = (p_pixel_1 < p_pixel_2) ? depth1 : depth2 + 0.01;
        double d1 = (p_pixel_1 < p_pixel_2) ? depth1 : depth2;
        //double d2 = (d1 == depth1) ? depth2 : depth1 + 0.02;
        double d2 = (d1 == depth1) ? depth2 : depth1;

        angle = acos((pow(d_between_pillars, 2) + pow(d1, 2) - pow(d2, 2)) / (2 * d1 * d_between_pillars));

        //ROS_INFO("Depth1: %f, Depth2: %f", d1, d2);

        //ROS_INFO("Angle: %f", angle);

        x_robot = d1 * sin(angle);
        y_robot = d1 * cos(angle);
        //ROS_INFO("Robot_Location: (%f, %f)", x_robot, y_robot);

        double x_d = ((x_1 > x_2) ? (x_1 - x_2) : (x_2 - x_1));
        double y_d = ((y_1 > y_2) ? (y_1 - y_2) : (y_2 - y_1));

        theta = atan(y_d / x_d) + M_PI / 2;

        //ROS_INFO("The theta value: %f", theta);
        object_detection::RobotPose robot_pose;
        robot_pose.x=x_robot;
        robot_pose.y=y_robot;
        robot_pose.theta=theta;
        pose_pub_.publish(robot_pose);

    }


    void color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg)
    {

        velocity.angular.z = 0.15;

        // pointer on OpenCV image
        cv_bridge::CvImagePtr cv_ptr;

        static const char cam_window[] = "(raw image)";
        static const char hsv_window[] = "(HSV image)";
        static const char color_window[] = "(color image)";

        try
        {
            // transform ROS image into OpenCV image
            cv_ptr = cv_bridge::toCvCopy(msg, enc::BGR8);
        }
        catch (cv_bridge::Exception& e)		// throw an error msg. if conversion fails
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        // show the raw camera image
        //imshow(cam_window, cv_ptr->image);

        Mat HSV_image;
        Mat low_image;
        Mat up_image;
        Mat image;
        Mat gray_image;

        fastNlMeansDenoisingColored(cv_ptr->image, image, 3,3,7,21);
        cvtColor(image,HSV_image,CV_BGR2HSV);
        cvtColor(cv_ptr->image,gray_image,COLOR_BGR2GRAY);


        // defining range thresholds in the HSV color space
        //cv::inRange(HSV_image,Scalar(20,100,100),Scalar(30,255,255),low_image);   //yellow
        //cv::inRange(HSV_image,Scalar(55,100,100),Scalar(65,255,255),up_image);

//        cv::inRange(HSV_image,Scalar(35,43,40),Scalar(77,255,255),low_image);   //green
//        cv::inRange(HSV_image,Scalar(35,43,40),Scalar(77,255,255),up_image);

        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),low_image);   //green
        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),up_image);
        //cv::inRange(HSV_image,Scalar(100,100,80),Scalar(140,255,255),low_image);   // blue
        //cv::inRange(HSV_image,Scalar(235,100,80),Scalar(255,255,255),up_image);

        // combines the images
        cv::addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);

        //imshow(hsv_window, image);
        cv::GaussianBlur(image, image, cv::Size(9,9), 2, 2); // smoothing contours


        //Find Contours
        vector<vector<Point> > contours;
        vector<Vec4i> hierarchy;
        Mat threshold_output;

        threshold(image, threshold_output,128,255,THRESH_BINARY);
        findContours(image, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );
        //cout << "Col x  " << red_image.cols <<  "Row Y " << red_image.rows  <<endl;  // 640 x 480

        //DrawContours
        vector<vector<Point> > contours_poly(contours.size());
        vector<Rect> boundRect(contours.size());
        //ROS_INFO("contours.size is %d",contours.size());

        int maxarea = 0;
        int secmaxarea = 0;
        int area_temp = 0;
        int max_area_index;
        int second_area_index;


        //threshold(image, threshold_output,100,255,THRESH_BINARY);

        vector<vector<Point> >hull( contours.size() );
        // computing bounding boxes around color blobs
        for (int i = 0; i < contours.size(); i++){
            convexHull( Mat(contours[i]), hull[i], false );
            approxPolyDP( Mat(contours[i]),contours_poly[i],3, true);
            boundRect[i] = boundingRect( Mat(contours_poly[i]));
        }

        ROS_INFO("CONTOUR: %d", contours.size() != 0);

        if(contours.size() != 0){
            Mat drawing2 = Mat::zeros( threshold_output.size(), CV_8UC3 );
            Mat drawing = Mat::zeros( image.size(), CV_8UC3);

            // find the max area
            //        for( int i = 0; i < contours.size(); i++ ){
            //          // drawing bounding box just around biggest color blob
            //          area_temp = boundRect[i].area();

            //          if(area_temp >= maxarea){
            //            maxarea = boundRect[i].area();
            //            max_area_index = i;
            //          }

            //        }

            //        // sets the color of the bounding box and draws it
            //        Scalar color = Scalar ( 255, 255, 255);
            //        rectangle( drawing, boundRect[max_area_index].tl(), boundRect[max_area_index].br(), color, 2, 8, 0);

            //        // computing center of color blob in pixel coordinates
            //        cent_contr_x = boundRect[max_area_index].x + boundRect[max_area_index].width/2 ;
            //        cent_contr_y = boundRect[max_area_index].y + boundRect[max_area_index].height/2 ;

            //        ROS_INFO("Center Coordinates: x=%d, y=%d", cent_contr_x, cent_contr_y);

            //        // Output the position of biggest blob --- Ball
            //        cv::circle(drawing, cv::Point(cent_contr_x, cent_contr_y), 5, CV_RGB(255,0,0));
            //        //cout << " X: " << cent_contr_x << " Y: " << cent_contr_y << " width: " << boundRect[max_area_index].width << "  height: "<< boundRect[max_area_index].height <<endl;
            //        //pixel_x = cent_contr_x;
            //        //pixel_y = cent_contr_y;
            //        imshow(color_window,drawing);



            // find two green areas

            for( int i = 0; i < contours.size(); i++ ){
                Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
                drawContours( drawing2, contours, i, color, 1, 8, vector<Vec4i>(), 0, Point() );
                drawContours( drawing2, hull, i, color, 1, 8, vector<Vec4i>(), 0, Point() );


                // drawing bounding box just around biggest color blob
                area_temp = boundRect[i].area();

                if(area_temp >= maxarea){
                    maxarea = boundRect[i].area();
                    max_area_index = i;
                }
            }

            for (int k = 0; k < contours.size(); k++)  // find the second largest
            {
                area_temp = boundRect[k].area();
                if (k != max_area_index) // skip over the largest one
                {
                    if (area_temp >= secmaxarea)
                    {
                        secmaxarea = boundRect[k].area();
                        second_area_index = k;
                    }
                }
            }

            bool exist_pillars = (boundRect[max_area_index].area() > bbx_threshold) && (boundRect[second_area_index].area() > bbx_threshold);

            bool exist_pillars1 = (boundRect[max_area_index].area() > bbx_threshold);

            ROS_INFO("Bound_size:  %d, Bound_size2 : %d", boundRect[max_area_index].area(),boundRect[second_area_index].area() );

            if(exist_pillars == true || (exist_pillars1 == true && flag == 2)){

                if (flag == 0 || flag == 1){
                    velocity.angular.z = 0.15;
                    flag = 2;
                }
                if (flag == 3){
                    velocity.angular.z = 0;

                    ROS_INFO("area: %d", boundRect[max_area_index].area());
                    Moments m1 = moments(contours[max_area_index], true);
                    Moments m2 = moments(contours[second_area_index], true);
                    Point p1(m1.m10/m1.m00,m1.m01/m1.m00);
                    Point p2(m2.m10/m2.m00,m2.m01/m2.m00);
                    cout<<"Point Center 1: "<<Mat(p1)<<endl;
                    cout<<"Point Center 2: "<<Mat(p2)<<endl;
                    circle(drawing2,p1,5,Scalar(128,0,0),-1);
                    circle(drawing2,p2,5,Scalar(128,0,0),-1);
                    //namedWindow( "center_image", CV_WINDOW_AUTOSIZE );
                    imshow( "center_image", drawing2 );

                    p_pixel_1 = p1.x;
                    p_pixel_2 = p2.x;

                    double p_pixel_11,p_pixel_22;
                    // sets the color of the bounding box and draws it
                    Scalar color = Scalar ( 255, 255, 255);
                    rectangle( drawing, boundRect[max_area_index].tl(), boundRect[max_area_index].br(), color, 2, 8, 0);
                    rectangle( drawing, boundRect[second_area_index].tl(), boundRect[second_area_index].br(), color, 2, 8, 0);
                    // computing center of color blob in pixel coordinates
                    p_pixel_11 = boundRect[max_area_index].x + boundRect[max_area_index].width/2 ;
                    int cent_contr_y = boundRect[max_area_index].y + boundRect[max_area_index].height*2/3 ;
                    p_pixel_22 = boundRect[second_area_index].x + boundRect[second_area_index].width/2 ;
                    int cent_contr_y_2 = boundRect[second_area_index].y + boundRect[second_area_index].height*2/3 ;

                    cv::circle(drawing, cv::Point(p_pixel_11, cent_contr_y), 5, CV_RGB(255,0,0));
                    cv::circle(drawing, cv::Point(p_pixel_22, cent_contr_y_2), 5, CV_RGB(255,0,0));

                    imshow(color_window,drawing);
                }

            }
            else
            {
                if (flag == 0){
                    flag = 1;
                    velocity.angular.z = 0.15;
                }

                if (flag == 2 || flag == 3){
                    flag = 3;
                    velocity.angular.z = -0.15;
                }



            }

            ROS_INFO("BOOL: %d", exist_pillars);
        }
        imshow(cam_window,cv_ptr->image);
        waitKey(3);
        ROS_INFO("Flag: %d, V: %f", flag, velocity.angular.z);

        vel_pub_.publish(velocity);

    }


};

int main(int argc, char** argv)
{

    ros::init(argc, argv, "my_scan_to_cloud");
    ros::NodeHandle n;
    LaserScanToPointCloud lstopc(n);
    ros::Rate loop_rate = 15;
    while(ros::ok()){
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}


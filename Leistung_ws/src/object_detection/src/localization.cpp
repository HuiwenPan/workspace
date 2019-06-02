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
#include "localization.h"
#include <stdlib.h>
using namespace std;
using namespace cv;
using namespace sensor_msgs;
namespace enc = sensor_msgs::image_encodings;



void LaserScanToPointCloud::laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan_in)
{
    double x_1, y_1, x_2, y_2, x_3, y_3, d_between_pillars, angle, depth1, depth2, depth3;
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

        if (cloud.channels[0].values[i] == (640.0 - p_pixel_3))
        {
            x_3 = -cloud.points[i].y;
            y_3 = cloud.points[i].x;
            //ROS_INFO("x1: %f, y1: %f", x_1, y_1);
        }

    }

    //d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2)) + 0.05;
    d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2));
    //a = 4 * (d_between_pillars + 0.028 * 2);
    a = 4 * (d_between_pillars);
    if (flag==3 && velocity.angular.z == 0){
        a_final = a;
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

    }


    //ROS_INFO("Distance between two pillars: %f", d_between_pillars);


    //ROS_INFO("Robot_Location: (%f, %f)", x_robot, y_robot);

//    ROS_INFO("The value of 'a' is: %f", a_final);
//    ROS_INFO("The value of 'b' is: %f", b_final);

    if (fflag==2 && velocity.angular.z == 0){
        depth3 = sqrt(pow(x_3, 2) + pow(y_3, 2));
        double find_y = sqrt(pow(depth3, 2) - pow(y_robot, 2));
        b = x_robot+find_y;
        b_final = b;
        ROS_INFO("The value of 'a' is: %f", a_final);
        ROS_INFO("The value of 'b' is: %f", b_final);

    }


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


void LaserScanToPointCloud::color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg)
{



    if (fflag == 2)
    {
        while(1)
        {
            velocity.angular.z = 0;
        }
    }
    else
    {
        velocity.angular.z = 0.15;
    }

    // pointer on OpenCV image
    cv_bridge::CvImagePtr cv_ptr;
    static const char cam_window[] = "(raw image)";
    static const char hsv_window[] = "(HSV image)";
    static const char hsv_window_blue[] = "(HSV image blue)";
    static const char hsv_window_yellow[] = "(HSV image yellow)";
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
    Mat HSV_image_blue;
    Mat HSV_image_yellow;

    Mat low_image;
    Mat up_image;
    Mat image;
    Mat image_blue;
    Mat image_yellow;
    Mat gray_image;

    //imshow(cam_window,cv_ptr->image);

    fastNlMeansDenoisingColored(cv_ptr->image, image, 10,10,7,21);
    cvtColor(image,HSV_image_blue,CV_BGR2HSV);
    cvtColor(image,HSV_image_yellow,CV_BGR2HSV);
    cvtColor(image,HSV_image,CV_BGR2HSV);
    cvtColor(cv_ptr->image,gray_image,COLOR_BGR2GRAY);

    //ROS_INFO("Flag color  %d", flag_color);
    if(flag_color == 0){
        cv::inRange(HSV_image_blue,Scalar(100,100,60),Scalar(140,255,255),low_image);   // blue
        cv::inRange(HSV_image_blue,Scalar(235,100,60),Scalar(255,255,255),up_image);
        cv::addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image_blue);
        cv::inRange(HSV_image_yellow,Scalar(20,100,100),Scalar(30,255,255),low_image);   //yellow
        cv::inRange(HSV_image_yellow,Scalar(55,100,100),Scalar(65,255,255),up_image);
        cv::addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image_yellow);

        //imshow(hsv_window_blue, image_blue);
        //imshow(hsv_window_yellow, image_yellow);
        cv::GaussianBlur(image_blue, image_blue, cv::Size(9,9), 2, 2);
        cv::GaussianBlur(image_yellow, image_yellow, cv::Size(9,9), 2, 2);

        //Find Contours
        vector<vector<Point> > contours_blue;
        vector<vector<Point> > contours_yellow;
        vector<Vec4i> hierarchy_blue;
        Mat threshold_output_blue;
        vector<Vec4i> hierarchy_yellow;
        Mat threshold_output_yellow;

        threshold(image_blue, threshold_output_blue,128,255,THRESH_BINARY);
        findContours(image_blue, contours_blue, hierarchy_blue, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );
        threshold(image_yellow, threshold_output_yellow,128,255,THRESH_BINARY);
        findContours(image_yellow, contours_yellow, hierarchy_yellow, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );

        vector<vector<Point> > contours_poly_blue(contours_blue.size());
        vector<Rect> boundRect_blue(contours_blue.size());
        vector<vector<Point> > contours_poly_yellow(contours_yellow.size());
        vector<Rect> boundRect_yellow(contours_yellow.size());

        for (int i = 0; i < contours_blue.size(); i++){
            approxPolyDP( Mat(contours_blue[i]),contours_poly_blue[i],3, true);
            boundRect_blue[i] = boundingRect( Mat(contours_poly_blue[i]));

        }
        for (int i = 0; i < contours_yellow.size(); i++){
            approxPolyDP( Mat(contours_yellow[i]),contours_poly_yellow[i],3, true);
            boundRect_yellow[i] = boundingRect( Mat(contours_poly_yellow[i]));

        }

        int temp=0;

        if(contours_blue.size() != 0 && contours_yellow.size() != 0){
            Scalar color_yellow = Scalar ( 0, 255, 255);
            Scalar color_blue = Scalar ( 255, 0, 0);
            Mat drawing_multi = Mat::zeros( image.size(), CV_8UC3);
            for( int i = 0; i < contours_blue.size(); i++ ){
                if(boundRect_blue[i].area()>= bbx_threshold_2){
                    rectangle( drawing_multi, boundRect_blue[i].tl(), boundRect_blue[i].br(), color_blue, 2, 8, 0);
                    temp = 1;
                }
            }
            for( int i = 0; i < contours_yellow.size(); i++ ){
                if(boundRect_yellow[i].area()>= bbx_threshold_2 && temp ==1){
                    //cout<<"contours :  "<<contours_poly_yellow[i]<<endl;
                    rectangle( drawing_multi, boundRect_yellow[i].tl(), boundRect_yellow[i].br(), color_yellow, 2, 8, 0);
                    flag_color = 1;
                }
            }
            //imshow("color_window", drawing_multi);
        }

    }
    if(flag_color == 1){

        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),low_image);   //green
        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),up_image);
        cv::addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
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

        //ROS_INFO("CONTOUR: %d", contours.size());

        if(contours.size() != 0){
            Mat drawing2 = Mat::zeros( threshold_output.size(), CV_8UC3 );
            Mat drawing = Mat::zeros( image.size(), CV_8UC3);

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

            //ROS_INFO("Bound_size:  %d, Bound_size2 : %d", boundRect[max_area_index].area(),boundRect[second_area_index].area() );

            if(exist_pillars == true || (exist_pillars1 == true && flag == 2)){

                if (flag == 0 || flag == 1){
                    velocity.angular.z = 0.15;
                    flag = 2;
                    ROS_INFO("exist_pillars: %d , exist_pillars1: %d", exist_pillars, exist_pillars1);
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
                    //imshow( "center_image", drawing2 );

                    p_pixel_1 = p1.x;
                    p_pixel_2 = p2.x;

                    double p_pixel_11,p_pixel_22;
                    // sets the color of the bounding box and draws it
                    Scalar color = Scalar ( 255, 255, 255);
                    //rectangle( drawing, boundRect[max_area_index].tl(), boundRect[max_area_index].br(), color, 2, 8, 0);
                    //rectangle( drawing, boundRect[second_area_index].tl(), boundRect[second_area_index].br(), color, 2, 8, 0);
                    // computing center of color blob in pixel coordinates
                    p_pixel_11 = boundRect[max_area_index].x + boundRect[max_area_index].width/2 ;
                    int cent_contr_y = boundRect[max_area_index].y + boundRect[max_area_index].height*2/3 ;
                    p_pixel_22 = boundRect[second_area_index].x + boundRect[second_area_index].width/2 ;
                    int cent_contr_y_2 = boundRect[second_area_index].y + boundRect[second_area_index].height*2/3 ;

                    cv::circle(drawing, cv::Point(p_pixel_11, cent_contr_y), 5, CV_RGB(255,0,0));
                    cv::circle(drawing, cv::Point(p_pixel_22, cent_contr_y_2), 5, CV_RGB(255,0,0));
                    ROS_INFO("exist_pillars: %d , exist_pillars1: %d", exist_pillars, exist_pillars1);
                    //imshow(color_window,drawing);
                }

            }
            else
            {
                if (flag == 0){
                    flag = 1;
                    velocity.angular.z = 0.15;
                    ROS_INFO("exist_pillars: %d , exist_pillars1: %d", exist_pillars, exist_pillars1);
                }

                if (flag == 2 || flag == 3){
                    flag = 3;
                    velocity.angular.z = -0.15;
                    ROS_INFO("exist_pillars: %d , exist_pillars1: %d", exist_pillars, exist_pillars1);
                }



            }

            //ROS_INFO("BOOL: %d", exist_pillars);
        }
    }

    //ROS_INFO("Flag: %d, V: %f", flag, velocity.angular.z);

    //###########################################################
    // this part is to turn back to calculate b
    if((flag==3 && velocity.angular.z==0) || flag == 4){
        flag = 4; //new state for turning back
        velocity.angular.z = 0.15;
        std::cout<<"READY!!!!!!!! now we are ready to calculate b!!!!"<<std::endl;

        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),low_image);   //green
        cv::inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),up_image);
        cv::addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
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
        //threshold(image, threshold_output,100,255,THRESH_BINARY);
        vector<vector<Point> >hull( contours.size() );
        // computing bounding boxes around color blobs
        for (int i = 0; i < contours.size(); i++){
            convexHull( Mat(contours[i]), hull[i], false );
            approxPolyDP( Mat(contours[i]),contours_poly[i],3, true);
            boundRect[i] = boundingRect( Mat(contours_poly[i]));
        }

        //ROS_INFO("CONTOUR: %d", contours.size());

        if(contours.size() != 0){
            // find largest green
            Mat drawing2 = Mat::zeros( threshold_output.size(), CV_8UC3 );
            Mat drawing = Mat::zeros( image.size(), CV_8UC3);

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

            // compute b
            Moments m1 = moments(contours[max_area_index], true);

            Point p1(m1.m10/m1.m00,m1.m01/m1.m00);

            cout<<"Point Center 1: "<<Mat(p1)<<endl;


            p_pixel_3 = p1.x;


            //ROS_INFO("CONTOUR area: %d", boundRect[max_area_index].area());

            bool exist_pillars11 = (boundRect[max_area_index].area() > 3500);

            ros::Time t_start;
            ros::Time t_end;
            if(exist_pillars11 == false){
                fflag = 1;
            }
            if(fflag == 1 && exist_pillars11 == true){
                fflag = 2;
                velocity.angular.z = 0;
            }
        }

//        ROS_INFO("Flag: %d, V: %f", flag, velocity.angular.z);

//        ROS_INFO("FFLAG: %d", fflag);

    }

    ROS_INFO("Flag: %d, V: %f", flag, velocity.angular.z);
    ROS_INFO("FFLAG: %d", fflag);


    waitKey(3);



    vel_pub_.publish(velocity);

}



void LaserScanToPointCloud::turnback_for_b(const sensor_msgs::CompressedImage::ConstPtr& msg){

    if(flag==3 & velocity.angular.z==0){
        std::cout<<"now we are ready to calculate b!!!!"<<std::endl;
    }

}


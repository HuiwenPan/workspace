#include "qt_connection.h"
#include "referee.h"

#include <ros/network.h>
#include <string>
#include <std_msgs/Float64.h>
#include <std_msgs/String.h>
#include <sstream>

using namespace std;
using namespace cv;
using namespace sensor_msgs;
namespace enc = sensor_msgs::image_encodings;

// initialize member variables
ConnectClass::ConnectClass(ros::NodeHandle n) :
    n_(n),
    laser_sub_(n_, "/scan", 10),
    laser_notifier_(laser_sub_,listener_, "/base_link", 10)
{
    laser_notifier_.registerCallback(boost::bind(&ConnectClass::laserCb, this, _1));
    laser_notifier_.setTolerance(ros::Duration(0.05));

    game_start = false;
    detection_start = false;
    get_ab_true_value = false;
    game_over = false;
    stop_movement = false;

    ROS_INFO("Starting advertising services for communicating with angelina!");

    vel_pub_ = n.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/navi", 1);
    odom_sub_ = n.subscribe("/odom", 10, &ConnectClass::getOdomCb, this);
    img_sub_ = n.subscribe("/camera/rgb/image_rect_color/compressed", 10, &ConnectClass::color_detection, this);

    qt_flag = 10;   // default value: 10
    flag = 0;
    flag_color = 0;
    flag_rotation = 0;
    flag_b = 0;
    goal_count = 0;

    distance = 0;

    bbx_threshold_ball = 8000;
    bbx_threshold_p_near = 4000;
    bbx_threshold_p_far = 1500;

    p_pixel_1 = 0;
    p_pixel_2 = 0;
    p_pixel_3 = 0;

    goal_pixel = 0;
    goal_depth = 0;

    finish_a = false;
    finish_b = false;
    start_tf = false;
    start_odom = false;
    flag_move = false;
    final_adjust = false;
    rotation_move = false;

    pillar_x = 0;
    pillar_y = 0;

    index_a = 0;
    index_b = 0;

    x_robot = 0;
    y_robot = 0;

    control_vel = 0;
    pos_error = 0;
    control_rot = 0;
    ang_error = 0;

    distance_before = 0;
    distance_now = 0;

    is_left = 1;

}


ConnectClass::~ConnectClass() {
    if(ros::isStarted()) {
        ros::shutdown(); // explicitly needed since we use ros::start();
        ros::waitForShutdown();
    }
    wait();
}

void ConnectClass::connectToServer() {
    int id = 1;
    referee = new Referee(id, this);
    int port = 10000;
    referee->connectToServer("129.187.240.172", port);

    ROS_WARN_STREAM("Connecting Signal to Slot");

    connect(referee, SIGNAL(gameStart()), this, SLOT(slotGameStart()));
    connect(referee, SIGNAL(detectionStart()), this, SLOT(slotDetectionStart()));
    connect(referee, SIGNAL(gameOver()), this, SLOT(slotGameOver()));
    connect(referee, SIGNAL(abValues(double,double)), this, SLOT(slotAbValues(double,double)));
    connect(referee, SIGNAL(stopMovement()), this, SLOT(slotStopMovement()));
    connect(referee, SIGNAL(trueColorOfTeam(TeamColor)), this, SLOT(slotTeamColor(TeamColor)));
    referee->reportReady();
    //referee->tellAbRatio(0.5);
    //TeamColor detected_color = yellow;
    //referee->tellTeamColor(detected_color);
}

// A QTimer that sends an Alive signal each 40 secs
void ConnectClass::start_alive_timer() {
    QTimer *aliveTimer = new QTimer(this);
    connect(aliveTimer, SIGNAL(timeout()), this, SLOT(slotSendAlive()));
    aliveTimer->start(40000);
}

// slot functions
void ConnectClass::slotGameStart() {
    game_start = true;
    std::cout << "Game has been started!";
}

void ConnectClass::slotDetectionStart() {
    detection_start = true;
    qt_flag = 0;
    std::cout << "Detection starts now!";
}

void ConnectClass::slotGameOver() {
    game_over = true;
    std::cout << "Game Over!";
}

void ConnectClass::slotAbValues(double a, double b) {
    value_a = a;
    value_b = b;
    get_ab_true_value = true;
    std::cout << "a: " << a << " ," << "b: " << b;
}

void ConnectClass::slotStopMovement() {
    stop_movement = true;
    std::cout << "Stop immediately!";
}

void ConnectClass::slotTeamColor(TeamColor color) {
    if (color == yellow)
    {
        std::cout << "Team color: Yellow";
        color_true = "yellow";
    }
    else
    {
        std::cout << "Team color: Blue";
        color_true = "blue";
    }
}

void ConnectClass::slotSendAlive()
{
      referee->sendAlive();
}


void ConnectClass::laserCb(const sensor_msgs::LaserScan::ConstPtr& scan_in)
{
    if (finish_a)
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
            }

            if (cloud.channels[0].values[i] == (640.0 - p_pixel_2))
            {
                x_2 = -cloud.points[i].y;
                y_2 = cloud.points[i].x;
            }
        }

        //d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2)) + 0.05;
        d_between_pillars = sqrt(pow((x_1 - x_2), 2) + pow((y_1 - y_2), 2));
        //a = 4 * (d_between_pillars + 0.028 * 2);
        a = 4 * (d_between_pillars);
        finish_a = false;

        ROS_INFO("XXXXXXXX  A: %f", a);
        
        depth1 = sqrt(pow(x_1, 2) + pow(y_1, 2));
        depth2 = sqrt(pow(x_2, 2) + pow(y_2, 2));
        ROS_INFO("XXXXXXXX  pillar_x_1, pillar_y_1: %f, %f", x_1, y_1);
        ROS_INFO("XXXXXXXX  pillar_x_2, pillar_y_2: %f, %f", x_2, y_2);
        //double d1 = (depth2 < depth1) ? depth1 : depth2 + 0.01;
        double d1 = (p_pixel_1 * is_left < p_pixel_2 * is_left) ? depth1 : depth2 + 0.01;
        //double d2 = (d1 == depth1) ? depth2 : depth1 + 0.02;
        double d2 = (d1 == depth1) ? depth2 : depth1 + 0.02;

        pillar_x = (p_pixel_1 * is_left < p_pixel_2 * is_left) ? x_1 : x_2;
        pillar_y = (p_pixel_1 * is_left < p_pixel_2 * is_left)? y_1 : y_2;

        angle = acos((pow(d_between_pillars, 2) + pow(d1, 2) - pow(d2, 2)) / (2 * d1 * d_between_pillars));

        x_robot = d1 * sin(angle);
        y_robot = d1 * cos(angle);
        ROS_INFO_STREAM("x_robot " << x_robot << " y_robot " << y_robot);

        double x_d = ((x_1 > x_2) ? (x_1 - x_2) : (x_2 - x_1));
        double y_d = ((y_1 > y_2) ? (y_1 - y_2) : (y_2 - y_1));

        theta = atan(y_d / x_d) + M_PI / 2;
        ROS_INFO("Theta value: %f", theta);

// ******************* tf odom to map ************************
        geometry_msgs::PoseStamped pillar_baselink, pillar_odom;
        tf::Quaternion euler_to_quad, quad_to_euler;

        euler_to_quad.setEuler(0, 0, -theta * is_left);

        pillar_baselink.header.frame_id = "base_link";
        pillar_baselink.header.stamp = ros::Time();
        pillar_baselink.pose.position.x = pillar_y;
        pillar_baselink.pose.position.y = -pillar_x;
        pillar_baselink.pose.orientation.x = 0;
        pillar_baselink.pose.orientation.y = 0;
        pillar_baselink.pose.orientation.z = euler_to_quad.QuadWord::getZ();
        pillar_baselink.pose.orientation.w = euler_to_quad.getW();

        listener_map.transformPose("odom", pillar_baselink, pillar_odom);

        quad_to_euler.QuadWord::setValue(pillar_odom.pose.orientation.x, pillar_odom.pose.orientation.y,
                                         pillar_odom.pose.orientation.z, pillar_odom.pose.orientation.w);

        transform.setOrigin(tf::Vector3(pillar_odom.pose.position.x, pillar_odom.pose.position.y, 0.0));
        transform.setRotation( quad_to_euler );

        start_tf = true;
    }

    if (start_tf)
    {
        br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "world_map"));
    }

    if(finish_b && qt_flag == 1)
    {
        double x_3, y_3, depth3;

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

        for (int i=0; i < cloud.channels[0].values.size(); i++)
        {
            if (cloud.channels[0].values[i] == (640.0 - p_pixel_3))
            {
                x_3 = -cloud.points[i].y;
                y_3 = cloud.points[i].x + 0.025;
            }
        }

        depth3 = sqrt(pow(x_3, 2) + pow(y_3, 2));

        double find_b = sqrt(pow(depth3, 2) - pow(y_robot, 2));

        b = x_robot + find_b;

        if (b > 0 && b < 5 && qt_flag == 1)
        {
            finish_b = false;
            ROS_INFO("the value of b is %f", b);
            referee->tellAbRatio(a / b);
            t0 = ros::Time::now().toSec();
            qt_flag = 2;
        }

    }

    if (qt_flag == 6 && flag_rotation == 1)
    {
        int count = 0;

        for(int i = -9; i < 10; i++)
        {
            if(scan_in->ranges[640 - (goal_pixel) - i ] < 2.5)

            {    goal_depth += scan_in->ranges[640 - (goal_pixel) - i ];

                count ++;
            }
        }
        if (count != 0)
        {
            goal_depth = goal_depth / count;
        }

        ROS_INFO("goal_pixel in lasercallback is %d", goal_pixel);
        ROS_INFO("goal_depth in lasercallback is %f", goal_depth);

        if (distance == 0  && goal_depth < 3 && goal_depth != 0) //when the first time the depth is not nan and small than 3 meter,
            //the distance will be created here, and only once,
            //this way insure that turtlebot will move in a straight line
        {
            t_start = ros::Time::now();
            distance = goal_depth;
            ROS_INFO("goal_depth in lasercallback is %f", goal_depth);
        }
        else if (distance == 0)
        {
            t_start = ros::Time::now();
            distance = 0.8;
        }
        else
        {

        }

        double t_run = distance / 0.15 + 2.0;
        ROS_INFO("t_run: %f", t_run);

        if ((ros::Time::now() - t_start).toSec() < t_run)
        {
            velocity.linear.x = 0.15;
            velocity.angular.z = 0;
            ROS_INFO("Time interval: %f", (ros::Time::now() - t_start).toSec());
        }
        else
        {
            velocity.linear.x = 0;
            velocity.angular.z = 0;
            qt_flag = 7;
            flag_rotation = 0;
            distance = 0;
            goal_pixel = 0;
            goal_depth = 0;
            index_v = 0;
        }
        vel_pub_.publish(velocity);
    }
}


void ConnectClass::color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg)
{
    switch (qt_flag)
    {

    case 0:
    {
        cv_bridge::CvImagePtr cv_ptr;

        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, enc::BGR8);
        }
        catch (cv_bridge::Exception& e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        Mat image, HSV_image, HSV_image_blue, HSV_image_yellow;
        Mat low_image, up_image;
        Mat image_blue, image_yellow;

        fastNlMeansDenoisingColored(cv_ptr->image, image, 10, 10, 7, 21);
        cvtColor(image,HSV_image_blue,CV_BGR2HSV);
        cvtColor(image,HSV_image_yellow,CV_BGR2HSV);
        cvtColor(image,HSV_image,CV_BGR2HSV);

        if(flag_color == 0)		// look for blue and yellow objects
        {
            velocity.angular.z = 0.6;
	    Rect rect(0, 150, 640, 280);
            Mat ROI_blue = HSV_image_blue(rect);
            Mat ROI_yellow = HSV_image_yellow(rect);
            inRange(ROI_blue,Scalar(100,100,60),Scalar(140,255,255),low_image);   // blue
            inRange(ROI_blue,Scalar(235,100,60),Scalar(255,255,255),up_image);
            addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image_blue);
            inRange(ROI_yellow,Scalar(20,100,100),Scalar(30,255,255),low_image);   //yellow
            inRange(ROI_yellow,Scalar(55,100,100),Scalar(65,255,255),up_image);
            addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image_yellow);

            GaussianBlur(image_blue, image_blue, cv::Size(9,9), 2, 2);
            GaussianBlur(image_yellow, image_yellow, cv::Size(9,9), 2, 2);

            //Find Contours
            vector<vector<Point> > contours_blue, contours_yellow;
            vector<Vec4i> hierarchy_blue, hierarchy_yellow;
            Mat threshold_output_blue, threshold_output_yellow;

            threshold(image_blue, threshold_output_blue,128,255,THRESH_BINARY);
            findContours(image_blue, contours_blue, hierarchy_blue, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );
            threshold(image_yellow, threshold_output_yellow,128,255,THRESH_BINARY);
            findContours(image_yellow, contours_yellow, hierarchy_yellow, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );

            vector<vector<Point> > contours_poly_blue(contours_blue.size());
            vector<Rect> boundRect_blue(contours_blue.size());
            vector<vector<Point> > contours_poly_yellow(contours_yellow.size());
            vector<Rect> boundRect_yellow(contours_yellow.size());

            for (int i = 0; i < contours_blue.size(); i++){
                approxPolyDP( Mat(contours_blue[i]), contours_poly_blue[i],3, true);
                boundRect_blue[i] = boundingRect( Mat(contours_poly_blue[i]));

            }
            for (int i = 0; i < contours_yellow.size(); i++){
                approxPolyDP( Mat(contours_yellow[i]), contours_poly_yellow[i],3, true);
                boundRect_yellow[i] = boundingRect( Mat(contours_poly_yellow[i]));
            }

            int temp = 0;
            int blue_count = 0;
            int yellow_count = 0;
            int blue_size = 0;
            int yellow_size = 0;
            int yellow_puck_large = 5000;
            int yellow_puck_small = 0;
            int blue_puck_large = 5000;
            int blue_puck_small = 0;
            int index_yellow_large = 0;
            int index_yellow_small = 0;
            int index_blue_large = 0;
            int index_blue_small = 0;
            string court_side;

            if(contours_blue.size() != 0 && contours_yellow.size() != 0)
            {
                for( int i = 0; i < contours_blue.size(); i++ ){
                    if(boundRect_blue[i].area() >= (bbx_threshold_ball - 7000))
                    {
                        if (boundRect_blue[i].area() > blue_puck_large)
                        {
                            index_blue_small = index_blue_large;
                            index_blue_large = i;

                            blue_puck_small = blue_puck_large;
                            blue_puck_large = boundRect_blue[i].area();
                        }
                        else if (boundRect_blue[i].area() > blue_puck_small)
                        {
                            index_blue_small = i;
                            blue_puck_small = boundRect_blue[i].area();
                        }
                        else
                        {

                        }

                        temp = 1;
                        blue_size += boundRect_blue[i].area();
                        blue_count ++;
                    }
                }
                for( int i = 0; i < contours_yellow.size(); i++ ){
                    if(boundRect_yellow[i].area() >= (bbx_threshold_ball - 7000) && temp ==1)
                    {
                        if (boundRect_yellow[i].area() > yellow_puck_large)
                        {
                            index_yellow_small = index_yellow_large;
                            index_yellow_large = i;

                            yellow_puck_small = yellow_puck_large;
                            yellow_puck_large = boundRect_yellow[i].area();
                        }
                        else if (boundRect_yellow[i].area() > yellow_puck_small)
                        {
                            index_yellow_small = i;
                            yellow_puck_small = boundRect_yellow[i].area();
                        }
                        else
                        {

                        }

                        yellow_count ++;
                        yellow_size += boundRect_yellow[i].area();

                    }
                }
                if (blue_count > 1 && yellow_count > 1)
                {
                    ROS_INFO_STREAM("blue: "<< blue_count << ", yellow: " << yellow_count);
                    ROS_INFO_STREAM("size_blue: " << blue_size << ", yellow: " << yellow_size);
                    flag_color = 1;
                    TeamColor detected_color = ((blue_size)> yellow_size) ? yellow : blue;
                    referee->tellTeamColor(detected_color);
                    if (blue_size > yellow_size)
                    {
                        Moments m1 = moments(contours_blue[index_blue_large], true);
                        Moments m2 = moments(contours_blue[index_blue_small], true);
                        Point p1(m1.m10/m1.m00, m1.m01/m1.m00);
                        Point p2(m2.m10/m2.m00, m2.m01/m2.m00);
                        ROS_INFO_STREAM("p1 " << p1.x << " " << "p2 " << p2.x);
                        court_side = (p1.x > p2.x) ? "right" : "left";
                        is_left = (p1.x > p2.x) ? -1 : 1;
                    }
                    else
                    {
                        Moments m1 = moments(contours_yellow[index_yellow_large], true);
                        Moments m2 = moments(contours_yellow[index_yellow_small], true);
                        Point p1(m1.m10/m1.m00, m1.m01/m1.m00);
                        Point p2(m2.m10/m2.m00, m2.m01/m2.m00);
                        //ROS_INFO_STREAM("Large: " << yellow_puck_large << " Small: " << yellow_puck_small);
                        court_side = (p1.x > p2.x) ? "right" : "left";
                        is_left = (p1.x > p2.x) ? -1 : 1;
                    }
                    ROS_INFO_STREAM(court_side);

                }
            }
        }

        if(flag_color == 1)	// look for green pillars
        {
            inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),low_image);   //green
            inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),up_image);
            addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
            GaussianBlur(image, image, cv::Size(9,9), 2, 2); // smoothing contours
            //Find Contours
            vector<vector<Point> > contours;
            vector<Vec4i> hierarchy;
            Mat threshold_output;
            threshold(image, threshold_output,128,255,THRESH_BINARY);
            findContours(image, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );

            vector<vector<Point> > contours_poly(contours.size());
            vector<Rect> boundRect(contours.size());

            int maxarea = 0;
            int secmaxarea = 0;
            int area_temp = 0;
            int max_area_index, second_area_index;
            vector<vector<Point>> hull( contours.size() );

            for (int i = 0; i < contours.size(); i++)
            {
                convexHull( Mat(contours[i]), hull[i], false );
                approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true);
                boundRect[i] = boundingRect( Mat(contours_poly[i]));
            }

            if(contours.size() != 0)
            {

                velocity.angular.z = 0.25 * is_left;
                for( int i = 0; i < contours.size(); i++ )
                {
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

                bool exist_pillars = (boundRect[max_area_index].area() > bbx_threshold_p_near) && (boundRect[second_area_index].area() > bbx_threshold_p_near);
                bool exist_one_pillar = (boundRect[max_area_index].area() > bbx_threshold_p_near);
                //ROS_INFO("the biggest green area is %d, the second biggest green area is %d",boundRect[max_area_index].area(), boundRect[second_area_index].area());
                ROS_WARN_STREAM(__LINE__);
                if(exist_pillars == true || (exist_one_pillar == true && flag == 2))
                {
                    if (flag == 0 || flag == 1)
                    {	// see two pillars the first time
                        velocity.angular.z = 0.25 * is_left;
                        flag = 2;

                        ROS_INFO("########################## flag is 2 !!!!!!!!!!!!!!!!!!!");
                        ROS_WARN_STREAM(__LINE__);
                    }
                    else
                    {
                        ROS_WARN_STREAM(__LINE__);
                    }

                    if(flag == 2)
                    {
                        ROS_WARN_STREAM(__LINE__);
                    }
                    else
                    {
                        ROS_WARN_STREAM(__LINE__);
                    }

                    if (flag == 3)
                    {
                        velocity.angular.z = 0;
                        ROS_WARN_STREAM(__LINE__);
                        //ROS_INFO("I see them twice!");
                        Moments m1 = moments(contours[max_area_index], true);
                        Moments m2 = moments(contours[second_area_index], true);
                        Point p1(m1.m10/m1.m00, m1.m01/m1.m00);
                        Point p2(m2.m10/m2.m00, m2.m01/m2.m00);
                        p_pixel_1 = p1.x;
                        p_pixel_2 = p2.x;
                        ROS_WARN_STREAM(__LINE__);
                    }
                    else
                    {
                        ROS_WARN_STREAM(__LINE__);
                    }
                }
                else
                {
                    if (flag == 0 && exist_one_pillar == true)  // see one pillar the first time
                    {
                        flag = 1;
                        //velocity.angular.z = 0.15;

                        ROS_WARN_STREAM(__LINE__);
                    }
                    else if ((flag == 2 && exist_one_pillar == false) || flag == 3)
                    {	// see one pillar after seen two pillars
                        flag = 3;
                        velocity.angular.z = - 0.2 * is_left;
                        ROS_WARN_STREAM(__LINE__);
                    }
                    else
                    {
                        velocity.angular.z = 0.25 * is_left;
                        ROS_WARN_STREAM(__LINE__);
                    }
                } // end else
                ROS_WARN_STREAM(__LINE__);
            } // endif contour.size() != 0
            else
            {
                if (flag == 2)
                {
                    flag = 3;
                    velocity.angular.z = - 0.2 * is_left;
                }

                ROS_WARN_STREAM(__LINE__);
            }
            ROS_WARN_STREAM(__LINE__);

        } // endif flag_color == 1

        vel_pub_.publish(velocity);

        //ROS_INFO("Velocity : %f", velocity.angular.z);

        if (flag==3 && velocity.angular.z == 0)
        {
            if (index_a > 5)
            {
                finish_a = true;
                qt_flag = 1;
            }
            index_a++;
        }
        else
        {
            ROS_WARN_STREAM(__LINE__);
        }

        break;

    } // end case 0

    case 1:
    {
        //this case represents measuring b
        velocity.angular.z = 0.2 * is_left;

        cv_bridge::CvImagePtr cv_ptr;

        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, enc::BGR8);
        }
        catch (cv_bridge::Exception& e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }
        Mat image, HSV_image;
        Mat low_image, up_image;

        fastNlMeansDenoisingColored(cv_ptr->image, image, 10, 10, 7, 21);
        cvtColor(image,HSV_image,CV_BGR2HSV);

        inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),low_image);   //green
        inRange(HSV_image,Scalar(40,40,40),Scalar(70,255,255),up_image);
        addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
        GaussianBlur(image, image, cv::Size(9,9), 2, 2); // smoothing contours
        vector<vector<Point> > contours;
        vector<Vec4i> hierarchy;
        Mat threshold_output;
        threshold(image, threshold_output,128,255,THRESH_BINARY);
        findContours(image, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );

        vector<vector<Point> > contours_poly(contours.size());
        vector<Rect> boundRect(contours.size());

        int maxarea = 0;

        int area_temp = 0;
        int max_area_index;

        vector<vector<Point> >hull( contours.size() );

        for (int i = 0; i < contours.size(); i++)
        {
            convexHull( Mat(contours[i]), hull[i], false );
            approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true);
            boundRect[i] = boundingRect( Mat(contours_poly[i]));
        }

        if(contours.size() != 0)
        {
            for( int i = 0; i < contours.size(); i++ )
            {
                area_temp = boundRect[i].area();
                if(area_temp >= maxarea){
                    maxarea = boundRect[i].area();
                    max_area_index = i;
                }
            }

            bool exist_one_pillar_b = (boundRect[max_area_index].area() > bbx_threshold_p_far);

            if (exist_one_pillar_b == false)
            {
                velocity.angular.z = 0.15*is_left;
                flag_b = 1;
            }

            if(flag_b == 1 && exist_one_pillar_b == true)
            {
                velocity.angular.z = 0;

                if (index_b > 10)
                {
                    Moments m1 = moments(contours[max_area_index], true);
                    Point p1(m1.m10/m1.m00, m1.m01/m1.m00);
                    p_pixel_3 = p1.x;
                    finish_b = true;
                    flag_b = 2;
                }
                index_b++;

            }

        }

        vel_pub_.publish(velocity);

        break;

    } // end case 1

    case 2:
    {
//        if (!game_start)
//        {
//            break;
//        }
        a = value_a;
        b = value_b;
        if (start_odom == true)
        {
            goal_pose.x = 0.5 * a;  // 0.5 * value_a
            goal_pose.y = - 0.3 - b * min(is_left, 0);
            goal_pose.theta = 0 * M_PI;
            ROS_INFO("PATH LOAD: 1st Destination!");
            simple_move_path();
            if (flag_move)
            {
                qt_flag = 23;
                flag_move = false;
            }
        }

        break;
    }

    case 23:
    {
        if (start_odom == true)
        {
            goal_pose.x = 1.3 * a;  // 1.25 * value_a
            goal_pose.y = - 0.3 - b * min(is_left, 0);
            goal_pose.theta = 1.8 * M_PI;
            ROS_INFO("PATH LOAD: 2nd Destination!");
            simple_move_path();
            if (flag_move)
            {
                qt_flag = 5;
                flag_move = false;
            }
        }

        break;

    }

    case 3:
    {
        if (start_odom == true)
        {
            goal_pose.x = 2.8;
            goal_pose.y = - 0.2;
            goal_pose.theta = 1.5 * M_PI;
            ROS_INFO("PATH LOAD!");
            simple_move_path();
            if (flag_move)
            {
                qt_flag = 4;
                flag_move = false;
            }
        }
        break;
    }

    case 4:
    {
        if (start_odom == true)
        {
            goal_pose.x = 2 * a;  // 2.4 * value_a   1.9*a
            goal_pose.y = - 0.5 * b - b * min(is_left, 0);    // -0.5 * value_b
            goal_pose.theta = (0.5 + (0.4 * goal_count)) * M_PI;
            ROS_INFO("PATH LOAD: Looking for Puck!");
            simple_move_path();
            if (flag_move)
            {
                qt_flag = 5;
                flag_move = false;
            }
        }
        break;
    }

    case 5:
    {
        cv_bridge::CvImagePtr cv_ptr;
        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, enc::BGR8);
        }
        catch (cv_bridge::Exception& e)		// throw an error msg. if conversion fails
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        Mat image;
        Mat HSV_image;
        Mat low_image;
        Mat up_image;
        fastNlMeansDenoisingColored(cv_ptr->image, image, 10, 10, 7, 21);
        cvtColor(image,HSV_image,CV_BGR2HSV);

        vector<vector<Point> > contours;
        vector<Vec4i> hierarchy;
        Mat threshold_output;

        int maxarea = 0;
        int area_temp = 0;
        int max_area_index;

        //string color = "yellow";    // string color = color_true;
        //string color = "blue";
        string color = color_true;
        if (color == "blue")
        {
            inRange(HSV_image,Scalar(100,100,60),Scalar(140,255,255), low_image);   // blue
            inRange(HSV_image,Scalar(235,100,60),Scalar(255,255,255), up_image);
            addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
        }
        else if(color == "yellow")
        {
            inRange(HSV_image,Scalar(20,100,100),Scalar(30,255,255),low_image);   //yellow
            inRange(HSV_image,Scalar(55,100,100),Scalar(65,255,255),up_image);
            addWeighted(low_image, 1.0, up_image, 1.0, 0.0, image);
        }


        threshold(image, threshold_output, 128, 255, THRESH_BINARY);
        findContours(image, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0) );

        vector<Rect> boundRect(contours.size());

        for (int i = 0; i < contours.size(); i++){
            boundRect[i] = boundingRect( Mat(contours[i]));
            area_temp = boundRect[i].area();

            if(area_temp >= maxarea){
                maxarea = boundRect[i].area();
                max_area_index = i;
            }
        }

        Moments m1 = moments(contours[max_area_index], true);

        Point p1(m1.m10/m1.m00, m1.m01/m1.m00);

        goal_pixel = p1.x + 10; // ass is -25, bube is +10
        int error_pixel = goal_pixel - 320;
        ROS_INFO("goal_pixel is %d", goal_pixel);

        ROS_INFO("flag_rotation is %d", flag_rotation );

        if (flag_rotation == 0)
        {
            if (abs(error_pixel) > 250)
            {
                velocity.angular.z = -0.4 * error_pixel / abs(error_pixel);

            }
            else if (abs(error_pixel) > 100)
            {
                velocity.angular.z = - 0.25 * error_pixel / abs(error_pixel);
            }
            else if (abs(error_pixel) > 50)
            {
                velocity.angular.z = - 0.15 * error_pixel / abs(error_pixel);
            }
            else if (abs(error_pixel) > 15)
            {
                velocity.angular.z = - 0.12 * error_pixel / abs(error_pixel);
            }
            else
            {
                velocity.angular.z = 0;
                if (index_v  > 5)
                {
                    flag_rotation = 1;
                    qt_flag = 6;
                    ROS_INFO("INDEX: %d", index_v);
                }
                index_v ++;
            }

            vel_pub_.publish(velocity);

        }

        ROS_INFO("angular velocity is %f",velocity.angular.z);
        break;


    }//end case 3

    case 6:
    {
        vel_pub_.publish(velocity);
        break;
    }

    case 7:
    {
        if (start_odom == true)
        {
            goal_pose.x = 2.3 * a + 0.05 * (2 - goal_count);  // 2.4 * value_a
            //goal_pose.y = - 1.5 + (2 - goal_count) * 0.18;    // -0.5 * value_b
            goal_pose.y = - 0.5 * b * is_left + (2 - goal_count) * 0.12;
            goal_pose.theta = 0 * M_PI;
            ROS_INFO("PATH LOAD: Goal!");
            simple_move_path();
            if (flag_move)
            {
                referee->reportGoal();
                qt_flag = 8;
                flag_move = false;
                goal_count ++;
                if (goal_count == 3)
                {
                    referee->reportDone();
                    ros::shutdown();
                }
                t_back_start = ros::Time::now();
            }
        }
        break;
    }

    case 8:
    {
        if ((ros::Time::now() - t_back_start).toSec() <  1.2)
        {
            velocity.linear.x = - 0.2;
            velocity.angular.z = 0;
            vel_pub_.publish(velocity);
        }
        else
        {
            velocity.linear.x = 0;
            velocity.angular.z = 0;
            qt_flag = 4;
        }
        break;
    }

    case 10:    // default case for initialization
    {
        if (detection_start)
        {
            qt_flag = 0;
        }
        break;
    }



    } // end switch
}

void ConnectClass::getOdomCb(const nav_msgs::Odometry::ConstPtr& msg)
{
    if (qt_flag == 2 || qt_flag == 3 || qt_flag == 4 || qt_flag == 7 || qt_flag == 23)
    {
    static tf::Quaternion Quat_to_euler;
    local_turtlepose.header.frame_id = "base_link";
    local_turtlepose.header.stamp = ros::Time();
    local_turtlepose.pose.position.x = 0;
    local_turtlepose.pose.position.y = 0;
    local_turtlepose.pose.position.z = 0;
    local_turtlepose.pose.orientation.x = 0;
    local_turtlepose.pose.orientation.y = 0;
    local_turtlepose.pose.orientation.z = 0;
    local_turtlepose.pose.orientation.w = 1;

    try
    {
        listener_map_local.transformPose("world_map", local_turtlepose, global_turtlepose);

        current_pose.x = global_turtlepose.pose.position.x;
        current_pose.y = global_turtlepose.pose.position.y;
        Quat_to_euler.QuadWord::setValue(global_turtlepose.pose.orientation.x,global_turtlepose.pose.orientation.y,
                                         global_turtlepose.pose.orientation.z,global_turtlepose.pose.orientation.w);

        current_pose.theta = tf::getYaw(Quat_to_euler);
        if (current_pose.theta < 0)
        {
            current_pose.theta = current_pose.theta + 2 * M_PI;
        }
    }
    catch(tf::TransformException& ex)
    {
        //ROS_ERROR("Received an exception trying to transform a point from \"world_map\" to \"odom\": %s", ex.what());
    }

    start_odom = true;

    }

    if( (ros::Time::now().toSec()-t0) >= 10)
    {
       double x_a, y_a;
       if (color_true == "blue")
       {
           if (is_left == 1)
           {
               x_a = current_pose.x;
               y_a = - current_pose.y;
           }
           else
           {
               x_a = current_pose.x;
               y_a = value_b - current_pose.y;
           }
       }
       else
       {
           if (is_left == 1)
           {
               x_a = 3 * value_a - current_pose.x;
               y_a = value_b + current_pose.y;
           }
           else
           {
               x_a = 3 * value_a - current_pose.x;
               y_a = current_pose.y;
           }
       }

       referee->tellEgoPos(x_a, y_a);
       t0 = ros::Time::now().toSec();
    }

}

void ConnectClass::rotation(double curr_x, double curr_y, double aim_x, double aim_y,
                            double final_ang, double curr_ang, bool final_adjust)
{
    float aim_ang, ang_ctrl, error_ang, det_x, det_y, dist;
    det_x = aim_x - curr_x;
    det_y = aim_y - curr_y;
    dist = sqrt(det_x * det_x + det_y * det_y);

    if (det_y >= 0 && det_x >= 0)
    {
        aim_ang = asin(det_y / dist);
    }
    else if (det_y >= 0 && det_x < 0)
    {
        aim_ang = M_PI - asin(det_y / dist);
    }
    else if (det_y < 0 && det_x >= 0)
    {
        aim_ang = 2 * M_PI - asin(fabs(det_y) / dist);
    }
    else
    {
        aim_ang = M_PI + asin(fabs(det_y) / dist);
    }

    if (final_adjust){
        aim_ang = final_ang;
    }

    error_ang = aim_ang - curr_ang;

    ang_ctrl = 0.3;

    if (fabs(error_ang) < 7 * M_PI / 4 && fabs(error_ang) > M_PI / 4)
    {
        ang_ctrl = 0.6;
    }
    if (fabs(error_ang) < 0.1 * M_PI || fabs(error_ang) > 1.9 * M_PI)
    {
        ang_ctrl = 0.2; //ang_ctrl = 0.09;
    }

    if (error_ang > 0) {
        if (error_ang > M_PI)
        {
            ang_ctrl = - ang_ctrl;
        }
    }
    else
    {
        if (error_ang > - M_PI)
        {
            ang_ctrl = - ang_ctrl;
        }
    }

    control_rot = ang_ctrl;
    ang_error = error_ang;
}

void ConnectClass::translation(double curr_x, double curr_y, double aim_x, double aim_y)
{
    double error_pose = 0;
    double vel, det_x, det_y;

    det_x = aim_x - curr_x;
    det_y = aim_y - curr_y;

    error_pose = sqrt(det_x * det_x + det_y * det_y);

    if (error_pose < 2 && error_pose > 0.8)
    {
        vel = 0.25;
    }
    else if (error_pose < 0.2)
    {
        vel = 0.05;
    }
    else
    {
        vel = 0.15;
    }

    control_vel = vel;
    pos_error = error_pose;
    distance_now = error_pose;
}

void ConnectClass::simple_move_path()
{

    rotation(current_pose.x, current_pose.y, goal_pose.x, goal_pose.y,
             goal_pose.theta, current_pose.theta, final_adjust);
    ROS_INFO("ANG_E:%f,POS_E:%f",ang_error, pos_error);
    if(fabs(ang_error) > 0.2 && fabs(ang_error) < 6.08 && !final_adjust)
    {
        velocity.angular.z = control_rot;
        velocity.linear.x = 0;
        ROS_WARN_STREAM(__LINE__);
    }  //endif if(ang_error > th_i)
    else
    {
        ROS_INFO("ROTATION DONE");
        translation(current_pose.x, current_pose.y, goal_pose.x, goal_pose.y);
        ROS_INFO("ANG_E:%f, POS_E:%f, Goal_X: %f, Goal_Y: %f.",ang_error, pos_error, goal_pose.x, goal_pose.y);
        if (pos_error > 0.1 && !final_adjust)
        {
            velocity.linear.x = control_vel;
            velocity.angular.z = 0;
        }//endif (ang_error < th_i) && (pos_error > th_i)
        else
        {
            final_adjust = true;
            ROS_INFO("TRANSLATION DONE");
            rotation(current_pose.x, current_pose.y, goal_pose.x, goal_pose.y,
                     goal_pose.theta, current_pose.theta, final_adjust);
            if (fabs(ang_error) > 0.1)
            {
                velocity.linear.x = 0;
                velocity.angular.z = control_rot;
            }//endif final_adjust (ang_error > th_i)
            else
            {
                ROS_INFO("IN POSITION");
                final_adjust = false;
                flag_move = true;
            }//endelse final_adjust (ang_error < th_i)
        }//endelse (ang_error < th_i) && (pos_error < th_i)
    } //endelse (ang_error < th_i)


    vel_pub_.publish(velocity);
    //ROS_INFO("all done!");

}



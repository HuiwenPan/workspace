#ifndef LOCALIZATION_H
#define LOCALIZATION_H

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
int flag_color = 0;
int fflag = 0;


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

    double a,a_final, b, b_final, x_robot, y_robot, theta, p_pixel_1, p_pixel_2, p_pixel_3;
    const int bbx_threshold = 15000;
    const int bbx_threshold_2 = 5000;
    geometry_msgs::Twist velocity;

    LaserScanToPointCloud(ros::NodeHandle n) :
        n_(n),
        laser_sub_(n_, "/scan", 10),
        laser_notifier_(laser_sub_,listener_, "/base_link", 10)
    {
             
        laser_notifier_.registerCallback(
                    boost::bind(&LaserScanToPointCloud::laserCallback, this, _1));
        laser_notifier_.setTolerance(ros::Duration(0.01));
        //scan_pub_ = n_.advertise<sensor_msgs::PointCloud>("/my_cloud",1);
        pixel_sub_ = n_.subscribe("/camera/rgb/image_rect_color/compressed", 10, &LaserScanToPointCloud::color_detection, this);
        //while(!(flag==3 & velocity.angular.z==0)){pixel_sub_ = n_.subscribe("/camera/rgb/image_rect_color/compressed", 10, &LaserScanToPointCloud::color_detection, this);}
        pose_pub_=n_.advertise<object_detection::RobotPose>("/robot_pose",10);
        vel_pub_=n_.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/navi",10);
    }



    void laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan_in);

    void color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg);

    void turnback_for_b(const sensor_msgs::CompressedImage::ConstPtr& msg);

};





#endif //LOCALIZATION_H

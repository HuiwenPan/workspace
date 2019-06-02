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
#include "localization.cpp"
using namespace std;
using namespace cv;
using namespace sensor_msgs;
namespace enc = sensor_msgs::image_encodings;


int main(int argc, char** argv)
{

    ros::init(argc, argv, "my_scan_to_cloud");
    ros::NodeHandle n;
    ros::CallbackQueue my_string_queue;
    LaserScanToPointCloud lstopc(n); // To calculate a



    ros::Rate loop_rate(20);
    while(ros::ok()){
        ros::spinOnce();
        loop_rate.sleep();
    }


    return 0;
}



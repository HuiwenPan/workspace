#include <ros/ros.h>
#include <std_msgs/String.h>
#include <test_1/test_srv.h>
#include <geometry_msgs/PoseStamped.h>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <cv.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CompressedImage.h>
#include <highgui.h>
#include <nav_msgs/Odometry.h>


using namespace cv;
namespace enc = sensor_msgs::image_encodings;
bool serverCb(test_1::test_srvRequest & req, test_1::test_srvResponse & res)
{

    res.output = req.input + 1;
    ROS_INFO("server: %d", res.output);

    return 0;
}

void timerCb_2(geometry_msgs::PoseStamped b)
{
    ROS_INFO("timer 2");
}

void timerCb_1(geometry_msgs::PoseStamped a)
{
    for(int i=0; i<5;i++){
    ROS_INFO("timer_1 times: %d , x: %f",i, a.pose.position.x);
    sleep(1);

    }
    //ROS_INFO("timer 1");
}

void getOdomCb(const nav_msgs::Odometry::ConstPtr& msg){
    while(1){
    ROS_INFO("odom topic");
    sleep(1);
    }


  }

void color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg){
  while(1){
    ROS_INFO("compressed image topic");
    sleep(2);
    }

}


int main(int argc, char**argv)
{

    ros::init(argc, argv, "test_srv");
    ros::NodeHandle n;
    // ros::AsyncSpinner spinner(3);
    // spinner.start();
    // ros::Subscriber odom_sub_ = n.subscribe("/odom", 10, getOdomCb);
    // ros::Subscriber img_sub_ = n.subscribe("/camera/rgb/image_rect_color/compressed", 10, color_detection);
//    ros::NodeHandle m;
 //    ros::Subscriber sub_1 = n.subscribe("/mogoal",10, timerCb_1);
    // ros::Subscriber sub_2 = n.subscribe("/nogoal",10, timerCb_2);
     ros::ServiceServer test_server = n.advertiseService("test_server", serverCb);
  //  ros::Timer timer_1 = n.createTimer(ros::Duration(1),boost::bind(timerCb_1,boost::ref(n)));
 //   ros::Timer timer_2 = n.createTimer(ros::Duration(1),boost::bind(timerCb_2,boost::ref(n)));
 //   ros::waitForShutdown();
    ros::spin();
    
    return 0;

}

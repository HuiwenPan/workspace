#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <test_1/test_srv.h>
int a =0;

// void getOdomCb( ros::ServiceClient &client){
//     static test_1::test_srv service_client;
//     static int i = 0;
//     ROS_INFO("odom topic");
//     sleep(1);
//     service_client.request.input = i++;
//     client.call(service_client);
//     }

void timerCb_2(const geometry_msgs::PoseStampedConstPtr &b)
{
    ROS_INFO("timer 2");
    std::cout<<a++;
}

int main(int argc, char** argv){
    ros::init(argc, argv, "test_clients");

    ros::AsyncSpinner spinner(3);
    spinner.start();
    ros::NodeHandle n;
    ros::ServiceClient  client = n.serviceClient<test_1::test_srv>("clients");
 //   ros::Subscriber odom_sub_ = n.subscribe("/mogoal", 1, boost::bind(&getOdomCb, boost::ref(client)));
    ros::Subscriber sub_2 = n.subscribe("/nogoal",1, timerCb_2);
    ros::waitForShutdown();
    return 0;
}
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <test_1/test_srv.h>
#include <geometry_msgs/PoseStamped.h>
#include <simple_move/simple_move_server.h>
#include <geometry_msgs/Pose2D.h>
int a=0;
bool serverCb(test_1::test_srvRequest & req, test_1::test_srvResponse & res)
{
    std_msgs::String output;
    res.output = req.input + 1;
    res.output_text = output;
    for(int i=0; i<5 ; i++){
        sleep(1);
        
    }
    return 0;
}

void timerCb_1(geometry_msgs::PoseStamped a)
{
    ROS_INFO("timer 2");
    sleep(0.5);
}

void timerCb_2(geometry_msgs::PoseStampedConstPtr b)
{
    ROS_INFO("timer 2");
    std::cout<<a++;
}


int main(int argc, char**argv)
{
    ros::init(argc, argv, "test_2");
    ros::NodeHandle n;
//    ros::NodeHandle m;
    ros::Subscriber sub_1 = n.subscribe("/mogoal",10, timerCb_1);
// for (int i = 0; i<10; i++){
//     if (i>5){
//      ros::Subscriber sub_2 = n.subscribe("/mogoal",10, timerCb_2);
//      ros::spinOnce();
//      }
// }
    // ros::ServiceServer test_server = n.advertiseService("test_server_2", serverCb);
    // ros::ServiceClient test_client = n.serviceClient<simple_move::simple_move_server>("simple_move_test");
    // simple_move::simple_move_server move_server;
    // move_server.request.Execute = 1;
    // test_client.call(move_server);

  //  ros::Timer timer_1 = n.createTimer(ros::Duration(1),boost::bind(timerCb_1,boost::ref(n)));
 //   ros::Timer timer_2 = n.createTimer(ros::Duration(1),boost::bind(timerCb_2,boost::ref(n)));
    ros::spin();

    return 0;

}

#include <ros/ros.h>
#include <geometry_msgs/Pose2D.h>
#include <create_map/create_map_srv.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>


int main(int argc, char**argv)
{
    ros::init(argc, argv, "create_map");
    ros::NodeHandle n;

    ros::Spin();
   
    return 0;
    
}

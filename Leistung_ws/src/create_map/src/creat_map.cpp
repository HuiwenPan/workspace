#include <ros/ros.h>
#include <geometry_msgs/Pose2D.h>
#include <create_map/create_map_srv.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

const double  PI=3.14159265;
bool teamcolor;
float a,b,x,y,theta;

void map_broadcaster(const ros::TimerEvent& event)
{
    static tf::TransformBroadcaster br_map, br_map_angilina; 
    static tf::Transform transform_map, transform_map_angilina;
    static tf::Quaternion q_map, q_map_angilina;
    static geometry_msgs::Pose2D origin_angilina;

    //相对地图
    
    q_map.setRPY(0,0,theta);
    transform_map.setOrigin(tf::Vector3(x,y,0.0));
    transform_map.setRotation(q_map);
    br_map.sendTransform(tf::StampedTransform(transform_map,ros::Time::now(),"odom","map"));

    //绝对地图
    if (teamcolor)   //0 蓝队　１黄队
    {
        origin_angilina.x = x + 3*a;
        origin_angilina.y = y + b;
        if (theta >= 0)
        {
            origin_angilina.theta = -(PI - theta);
        } 
        else
        {
            origin_angilina.theta = PI + theta;
        }
    }
        //相对地图
    q_map_angilina.setRPY(0,0,origin_angilina.theta);
    transform_map_angilina.setOrigin(tf::Vector3(origin_angilina.y,origin_angilina.y,0.0));
    transform_map_angilina.setRotation(q_map_angilina);
    br_map_angilina.sendTransform(tf::StampedTransform(transform_map_angilina,ros::Time::now(),"odom","map_angilina"));
}


bool get_ab(create_map::create_map_srv::Request  &req,
            create_map::create_map_srv::Response &res){
    a = req.a;
    b = req.b;
    theta = req.theta;
    teamcolor = req.teamcolor;
    x = req.x;
    y = req.y;
    //res.result = true;
    ROS_INFO("CREATE MAP!");
    
    return true;

}
            





int main(int argc, char**argv)
{
    ros::init(argc, argv, "create_map");
    ros::NodeHandle n;
    ros::ServiceServer  server_map = n.advertiseService("create_map", get_ab);
    tf::TransformListener listener_;
    double odom_origin_theta,odom_origin_x,odom_origin_y,pillar_x,pillar_y;
    pillar_x = 0.82;
    pillar_y = 0.06;
    theta = 3.66;


//#####################################################################
            geometry_msgs::PoseStamped pillar_baselink,pillar_odom;
            tf::Transformer  current_pose;
            tf::Quaternion Quad_to_euler, Map_in_baselink;
            Map_in_baselink.setEuler(theta + M_PI/2,0,0);
            pillar_baselink.header.frame_id = "base_link";
            pillar_baselink.header.stamp = ros::Time();
            pillar_baselink.pose.position.x = pillar_x;                   //把baselink的原点映射到odom中
            pillar_baselink.pose.position.y = pillar_y;
            pillar_baselink.pose.position.z = 0;
            pillar_baselink.pose.orientation.x = Map_in_baselink.QuadWord::getX();
            pillar_baselink.pose.orientation.y = Map_in_baselink.QuadWord::getY();
            pillar_baselink.pose.orientation.z = Map_in_baselink.QuadWord::getZ();
            pillar_baselink.pose.orientation.w = Map_in_baselink.getW();
            // pillar_baselink.pose.orientation.x = 0;
            // pillar_baselink.pose.orientation.y = 0;
            // pillar_baselink.pose.orientation.z = sin(-theta/2);
            // pillar_baselink.pose.orientation.w = cos(-theta/2);

            listener_.transformPose("odom",pillar_baselink, pillar_odom);

            odom_origin_x = pillar_odom.pose.position.x;
            odom_origin_y = pillar_odom.pose.position.y;
            Quad_to_euler.QuadWord::setValue(pillar_odom.pose.orientation.x, pillar_odom.pose.orientation.y, pillar_odom.pose.orientation.z, pillar_odom.pose.orientation.w);
            odom_origin_theta = tf::getYaw(Quad_to_euler);
            ROS_INFO("origin_x:%.2f ,origin_y:%.2f ,origin_theta:%.2f ",odom_origin_x, odom_origin_y, odom_origin_theta);
//#####################################################################
    x = odom_origin_x;
    y = odom_origin_y;
    theta = odom_origin_theta;
    a = 1.2;
    b = 4;
    teamcolor = 1;
    
    ros::Timer timer = n.createTimer(ros::Duration(0.01), map_broadcaster);
    ros::spin();
    return 0;
}




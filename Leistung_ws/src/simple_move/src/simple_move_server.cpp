#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Twist.h>
#include <tf/transform_listener.h>
#include <tf2/LinearMath/Quaternion.h>
#include <std_msgs/String.h>
#include <boost/thread.hpp>
#include "simple_move/simple_move_server.h"

class Simple_move_server
{
    protected: 

        ros::NodeHandle nh_;

                //parameters
        const float  PI=3.14159265;
        float goal_x,goal_y;
        float goal_x_map, goal_y_map;
        float x_l,y_l;
        float control[4] = {0,0,0,0};        // 1.线速度 2.位置误差 3.角速度 4.角误差
        geometry_msgs::Pose2D Path[4];       // 路径
        float Path_error[4];                 // 路径点的允许误差
        geometry_msgs::Twist Vel;
        float curr_angle,goal_angle;
        float final_angle_error;
        float distance_1,distance_2,error_distance;        //用来计算位置微分
        std::string goal_frame_id;
        tf::Quaternion goal_quaternion;

                //action
        ros::ServiceServer server_;          //server 句柄
        ros::Publisher pub ;
        ros::Timer listner_rate;
        tf::TransformListener pose_transform;
        





    public:
        Simple_move_server(std::string name, ros::NodeHandle n): nh_(n)
        {
            Path[0].x = 1;
            Path[0].y = -0.5;
            Path[0].theta = 0;
            Path[1].x = 1.5;
            Path[1].y = -0.5;
            Path[1].theta = 0;
            Path[2].x = 1.5;
            Path[2].y = -1;
            Path[2].theta = 0;
            Path[3].x = 1.7;
            Path[3].y = -1;
            Path[3].theta = 0;

            pub = nh_.advertise<geometry_msgs::Twist>("cmd_vel_mux/input/navi", 100);
            server_ = nh_.advertiseService(name, &Simple_move_server::execute, this);
            ROS_INFO("access in execute!");

        };

        ~Simple_move_server(void){};

        //functions
        bool execute(simple_move::simple_move_serverRequest &goal_,
                    simple_move::simple_move_serverResponse &final_);
        void transform_current_pose(const tf::TransformListener& listener);
        void Rotation(float curr_x, float curr_y, float aim_x,float aim_y,float final_ang, float curr_ang, float *control, bool final_adjust);
        void Go(float curr_x, float curr_y, float aim_x,float aim_y, float *control);



};

    bool Simple_move_server::execute(simple_move::simple_move_serverRequest &goal_,
                                     simple_move::simple_move_serverResponse &final_)
{

    ros::Rate r(20);
    for(int i = 0; i < sizeof(Path) / sizeof(Path[0]); i++)
    {
        while (control[1] > 0.01)
        {
            distance_2 = 1000;
            goal_x = Path[i].x;
            goal_y = Path[i].y;
            goal_angle = Path[i].theta;



            do{
              //角度控制
                Simple_move_server::Rotation(x_l,y_l,goal_x,goal_y,goal_angle,curr_angle,control,false);  
                Vel.linear.x = 0;
                Vel.angular.z = control[2];
                pub.publish(Vel);
                r.sleep();
                }while(fabs(control[3])>= 0.01);           //单次控制 角度误差小于0.01 
            Vel.angular.z = 0;
            sleep(0.5);

            ROS_INFO_STREAM("ROTATE FINISH!");   
            do{
             //直线行走
                Simple_move_server::Go(x_l,y_l,goal_x,goal_y,control);
                Vel.angular.z = 0;
                Vel.linear.x = control[0];
                pub.publish(Vel);
                r.sleep();
                error_distance = distance_1 - distance_2;
                distance_2 = distance_1;
                if (error_distance > 0.0005){    //位置误差微分大于0，跳出本次控制
                break;}
                }while(control[1]>=0.01);            //单次控制 位置误差小于0.1
            ROS_INFO_STREAM("GO FINISH!");       
            Vel.linear.x = 0;
            sleep(0.5);


            if ( control[1]<=0.01){
                ROS_INFO("IN POSITION!");               //位置基本吻合，跳出行动控制，返回完成信息。
                break;
            }
        }
        do{
            //获取/goal的目标点，保存到本地
            Simple_move_server::Rotation(x_l,y_l,goal_x,goal_y,goal_angle,curr_angle,control,true);  
            Vel.angular.z = control[2];
            pub.publish(Vel);
            r.sleep();
            }while(fabs(control[3])>= 0.001);           //单次控制 角度误差小于0.01  
            Vel.angular.z = 0; 
            ROS_INFO("ALL DONE!"); 
    }





    final_.final_pose.x = x_l;
    final_.final_pose.y = y_l;
    final_.final_pose.theta = curr_angle;
    return 0;
}


//baselink上坐标点转化为odom上的点, curr_angle 为turtlebot基于odom坐标的角度 x_l y_l 为turtlebot基于odom的当前坐标
//feedback_ 赋值
    void Simple_move_server::transform_current_pose(const tf::TransformListener& listener)
{

    geometry_msgs::PoseStamped local_turtlepose;
                                                                // 反馈odom下的机器人pose，为角度控制提供反馈
    tf::Transformer  current_pose;
    tf::Quaternion Quat_to_euler;
    local_turtlepose.header.frame_id = "base_link";
    local_turtlepose.header.stamp = ros::Time();
    local_turtlepose.pose.position.x = 0;                   //把baselink的原点映射到odom中
    local_turtlepose.pose.position.y = 0;
    local_turtlepose.pose.position.z = 0;
    local_turtlepose.pose.orientation.x = 0;
    local_turtlepose.pose.orientation.y = 0;
    local_turtlepose.pose.orientation.z = 0;
    local_turtlepose.pose.orientation.w = 1;

    try {
        geometry_msgs::PoseStamped map_turtlepose;

        listener.transformPose("map",local_turtlepose,map_turtlepose);    //tf转换  point
        ROS_INFO("Turtle in odom: (%.2f, %.2f. %.2f)",
            map_turtlepose.pose.position.x, map_turtlepose.pose.position.y, map_turtlepose.pose.position.z, map_turtlepose.header.stamp.toSec());

        x_l = map_turtlepose.pose.position.x;
        y_l = map_turtlepose.pose.position.y;
        Quat_to_euler.QuadWord::setValue(map_turtlepose.pose.orientation.x,map_turtlepose.pose.orientation.y,map_turtlepose.pose.orientation.z,map_turtlepose.pose.orientation.w);
        ROS_INFO("QUATERNION:%.2f,%.2f,%.2f,%.2f",map_turtlepose.pose.orientation.x,map_turtlepose.pose.orientation.y,map_turtlepose.pose.orientation.z,map_turtlepose.pose.orientation.w);
        curr_angle = tf::getYaw(Quat_to_euler);
        if (curr_angle<0)
        { curr_angle = curr_angle + 2*PI;}
        ROS_INFO("Turtle current angle : %.2f",curr_angle);

    }
    catch(tf::TransformException& ex){
        ROS_ERROR("Received an exception trying to transform a point from \"world\" to \"odom\": %s", ex.what());

    }
    

}

//控制turtlebot旋转
    void Simple_move_server::Rotation(float curr_x, float curr_y, float aim_x,float aim_y,float final_ang, float curr_ang, float *control, bool final_adjust)
{
        float aim_ang,ang_ctrl,error_ang,det_x,det_y,dist;
        det_x = (aim_x-curr_x);
        det_y = (aim_y-curr_y);
        dist =  sqrt(det_x*det_x+det_y*det_y);   //以后可以直接用depth代替
        if (det_y >=0 && det_x >= 0)
            {aim_ang = asin(det_y/dist);}
        else if (det_y >= 0 && det_x < 0)
            {aim_ang = PI -asin(det_y/dist);}      //判断目标点相对于baselink的角度
        else if (det_y < 0 && det_x >= 0)
            {aim_ang = 2*PI - asin(fabs(det_y)/dist);}
        else
            {aim_ang = PI + asin(fabs(det_y)/dist);}    //得出目标点的 2PI表达式

        if (final_adjust){
            aim_ang = final_ang;
        }
        
        error_ang = aim_ang - curr_ang;       //角度误差的 2PI表达式

        ang_ctrl = 0.3;                     //角速度控制 大小控制函数
        if (fabs(error_ang)<5*PI/3 && fabs(error_ang > PI/3)){
            ang_ctrl = 0.8;} 
        if (fabs(error_ang)<0.1 || fabs(error_ang > 6.1)){
            ang_ctrl = 0.05;
        }                 

        if (error_ang > 0){                 //角速度控制  方向控制函数
            if (error_ang > PI){
                ang_ctrl = -ang_ctrl;
            }}
        else
        {
            if (error_ang > -PI){
                ang_ctrl = -ang_ctrl;
            }
        }
                                        

        ROS_INFO("Aim angle:%f",aim_ang);
        ROS_INFO("Ang error:%f",error_ang);
        ROS_INFO("angle control:%f",ang_ctrl);
        
        *(control+2) = ang_ctrl;
        *(control+3) = error_ang;
    
}

//控制turtlebot前进
    void Simple_move_server::Go(float curr_x, float curr_y, float aim_x,float aim_y, float *control)
{
    float error_pose = 0;
    float vel,det_x,det_y;

    det_x = aim_x-curr_x;
    det_y = aim_y-curr_y;


    error_pose = fabs(sqrt(det_x*det_x+det_y*det_y));
    if (error_pose < 2 && error_pose >0.8){
        vel = 0.2;
    }     
    else if (error_pose < 0.3)   {
        vel = 0.05;
    }
    else
        {vel = 0.1;}
    
    ROS_INFO("distance:%f",error_pose);
    ROS_INFO("velocity:%f",vel);
    

    *control = vel;
    *(control+1) = error_pose;
    distance_1 = error_pose;

}


int main(int argc, char ** argv){
    ros::init(argc, argv, "simple_move_server");
    ros::AsyncSpinner s(2);
    s.start();
    ros::NodeHandle n;

    Simple_move_server move("simple_move_server",n);

    ros::waitForShutdown();

    return 0;
}
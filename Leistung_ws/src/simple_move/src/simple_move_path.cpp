#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Twist.h>
#include <tf/transform_listener.h>
#include <tf2/LinearMath/Quaternion.h>
#include <sensor_msgs/CompressedImage.h>

//######## opencv
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <cv.h>
#include <highgui.h>

const double  PI=3.14159265;
geometry_msgs::Pose2D goal_pose;
geometry_msgs::Pose2D current_pose;
std::string goal_frame_id;
geometry_msgs::Pose2D Path[3];
float distance_1,distance_2,error_distance;        //用来计算位置微分
float Path_point_error[3];
float a, b;                                       //地图大小ａ，ｂ

//baselink上坐标点转化为odom上的点，为后面的闭环控制提供反馈, current_pose.theta 为turtlebot基于odom坐标的角度
//current_pose.x current_pose.y 为turtlebot基于odom的当前坐标
void transformPoint(const tf::TransformListener& listener){

  geometry_msgs::PoseStamped local_turtlepose;
                                                            // 反馈odom下的机器人pose，为角度控制提供反馈
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
    geometry_msgs::PoseStamped global_turtlepose;
    listener.transformPose("map",local_turtlepose,global_turtlepose);    //tf转换  point
    ROS_INFO("Turtle in odom: (%.2f, %.2f, %.2f ,%.2f)",
    global_turtlepose.pose.position.x, global_turtlepose.pose.position.y, global_turtlepose.pose.position.z, global_turtlepose.header.stamp.toSec());

    current_pose.x = global_turtlepose.pose.position.x;
    current_pose.y = global_turtlepose.pose.position.y;
    Quat_to_euler.QuadWord::setValue(global_turtlepose.pose.orientation.x,global_turtlepose.pose.orientation.y,global_turtlepose.pose.orientation.z,global_turtlepose.pose.orientation.w);
   // ROS_INFO("QUATERNION:%.2f,%.2f,%.2f,%.2f",global_turtlepose.pose.orientation.x,global_turtlepose.pose.orientation.y,global_turtlepose.pose.orientation.z,global_turtlepose.pose.orientation.w);
    current_pose.theta = tf::getYaw(Quat_to_euler);
    if (current_pose.theta<0)
    { current_pose.theta = current_pose.theta + 2*PI;}
    ROS_INFO("Turtle current angle : %.2f",current_pose.theta);
    ;
  }
  catch(tf::TransformException& ex){
    ROS_ERROR("Received an exception trying to transform a point from \"world\" to \"odom\": %s", ex.what());
  }

}

//控制turtlebot旋转
void Rotation(geometry_msgs::Pose2D &goal_pose, geometry_msgs::Pose2D &current_pose , float *control, bool final_adjust)
{
    float aim_ang,ang_ctrl,error_ang,det_x,det_y,dist;
    det_x = (goal_pose.x-current_pose.x);
    det_y = (goal_pose.y-current_pose.y);
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
        aim_ang = goal_pose.theta;
    }
    
    error_ang = aim_ang - current_pose.theta;       //角度误差的 2PI表达式

    ang_ctrl = 0.3;                     //角速度控制 大小控制函数
    if (fabs(error_ang)<5*PI/3 && fabs(error_ang > PI/8)){
        ang_ctrl = 0.6;} 
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
void Go(geometry_msgs::Pose2D &goal_pose, geometry_msgs::Pose2D &current_pose, float *control)
{
    float error_pose = 0;
    float vel,det_x,det_y;

    det_x = goal_pose.x-current_pose.x;
    det_y = goal_pose.y-current_pose.y;


    error_pose = fabs(sqrt(det_x*det_x+det_y*det_y));
    if (error_pose < 2 && error_pose >0.35){
        vel = 0.3;
    }     
    else if (error_pose < 0.1)   {
        vel = 0.05;
    }
    else
        {vel = 0.15;}
    
   // ROS_INFO("distance:%f",error_pose);
   // ROS_INFO("velocity:%f",vel);
    

    *control = vel;
    *(control+1) = error_pose;
    distance_1 = error_pose;

}

void color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg){
  while(1){
    ROS_INFO("compressed image topic");
    sleep(2);
    }

}


int main(int argc, char** argv){

    float control[4] = {0,0,0,0};        // 1.线速度 2.位置误差 3.角速度 4.角误差
    geometry_msgs::Twist Vel;
    a = 1.2;
    b = 3;
// path planning
    Path[0].x = 1.5*a;
    Path[0].y = -0.85*b;
    Path[0].theta = 0;
    Path[1].x = 2.5*a;
    Path[1].y = -0.85*b;
    Path[1].theta = 0;
    Path[2].x = 2.5*a;
    Path[2].y = -0.5*b;
    Path[2].theta = 0;

// path error
    Path_point_error[0] = 0.1;
    Path_point_error[1] = 0.1;
    Path_point_error[2] = 0.01;



    ros::init(argc, argv, "simple_move_Path");
    ros::NodeHandle n;
    
    ros::Subscriber sub = n.subscribe("/camera/rgb/image_rect_color/compressed", 10, color_detection);
    ros::Publisher pub = n.advertise<geometry_msgs::Twist>("cmd_vel_mux/input/navi", 100);
    tf::TransformListener pose_transform(ros::Duration(5));
    ros::Timer listner_rate=n.createTimer(ros::Duration(0.05),boost::bind(&transformPoint, boost::ref(pose_transform)));
    ros::Rate r(20);
    sleep(2);
    for(int i = 0; i < sizeof(Path)/sizeof(Path[0]); i++)
    {
        goal_pose.x = Path[i].x;
        goal_pose.y = Path[i].y;
        goal_pose.theta = Path[i].theta;
        while (ros::ok())
        {
            distance_2 = 1000;
            do{               //角度控制
                ros::spinOnce();
                Rotation(goal_pose, current_pose, control,false);  
                Vel.linear.x = 0;
                Vel.angular.z = control[2];
                pub.publish(Vel);
                r.sleep();
                }while(fabs(control[3])>= 0.01);           //单次控制 角度误差小于0.01 
            Vel.angular.z = 0;
            sleep(0.1);

            ROS_INFO_STREAM("ROTATE FINISH!");   
            do{                //直线行走
                ros::spinOnce();
                Go(goal_pose, current_pose, control);
                Vel.angular.z = 0;
                Vel.linear.x = control[0];
                pub.publish(Vel);
                r.sleep();
                error_distance = distance_1 - distance_2;
                distance_2 = distance_1;
                if (error_distance > 0.0005){    //位置误差微分大于0，跳出本次控制
                break;}
                }while(control[1]>=Path_point_error[i]);            //单次控制 位置误差小于0.1
            ROS_INFO_STREAM("GO FINISH!");       
            Vel.linear.x = 0;
                
            ros::spinOnce();
            r.sleep();

            if ( control[1]<=Path_point_error[i]){
                ROS_INFO("IN POSITION!");               //位置基本吻合，跳出行动控制，返回完成信息。
                break;
            }
        }
        do{              //获取/goal的目标点，保存到本地
            ros::spinOnce();
            Rotation(goal_pose, current_pose,control,true);  
            Vel.angular.z = control[2];
            pub.publish(Vel);
            r.sleep();
            }while((fabs(control[3])>= 0.001) && i == 2);           //单次控制 角度误差小于0.01 , 最后一次才矫正角度 
        ROS_INFO("%d time is DONE!", i+1);
    }

    //倒车
    for(int a=0; a<50; a++)
    {
        ros::spinOnce();
        Vel.linear.x = -0.3;
        ROS_INFO("BACK");
        r.sleep();
    }

    ROS_INFO("all done!");
  return 0;
}
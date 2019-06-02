#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>
#include <tf/transform_listener.h>
#include <tf2/LinearMath/Quaternion.h>

const double  PI=3.14159265;
float goal_x,goal_y;
float x_l,y_l;
float curr_angle,goal_angle;
float final_angle_error;
float distance_1,distance_2,error_distance;        //用来计算位置微分
std::string goal_frame_id;
tf::Quaternion goal_quaternion;

//把odom的目标点存到本地，goal_x goal_y为基于odom坐标的目标点坐标，
void get_goal_callback(const geometry_msgs::PoseStamped& goal){

  goal_x = goal.pose.position.x;
  goal_y = goal.pose.position.y;
  goal_frame_id = goal.header.frame_id;
  goal_quaternion.setValue(goal.pose.orientation.x,goal.pose.orientation.y,goal.pose.orientation.z,goal.pose.orientation.w);
  goal_angle = tf::getYaw(goal_quaternion);
  if (goal_angle < 0){
      goal_angle = goal_angle + 2*PI;    //把目标位姿转换为 2PI形式
  }
}
//baselink上坐标点转化为odom上的点，为后面的闭环控制提供反馈, curr_angle 为turtlebot基于odom坐标的角度
//x_l y_l 为turtlebot基于odom的当前坐标
void transformPoint(const tf::TransformListener& listener){

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
    geometry_msgs::PoseStamped global_turtlepose;

    listener.transformPose("odom",local_turtlepose,global_turtlepose);    //tf转换  point
    ROS_INFO("Turtle in odom: (%.2f, %.2f. %.2f)",
        global_turtlepose.pose.position.x, global_turtlepose.pose.position.y, global_turtlepose.pose.position.z, global_turtlepose.header.stamp.toSec());

    x_l = global_turtlepose.pose.position.x;
    y_l = global_turtlepose.pose.position.y;
    Quat_to_euler.QuadWord::setValue(global_turtlepose.pose.orientation.x,global_turtlepose.pose.orientation.y,global_turtlepose.pose.orientation.z,global_turtlepose.pose.orientation.w);
    ROS_INFO("QUATERNION:%.2f,%.2f,%.2f,%.2f",global_turtlepose.pose.orientation.x,global_turtlepose.pose.orientation.y,global_turtlepose.pose.orientation.z,global_turtlepose.pose.orientation.w);
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
void Rotation(float curr_x, float curr_y, float aim_x,float aim_y,float final_ang, float curr_ang, float *control, bool final_adjust)
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
void Go(float curr_x, float curr_y, float aim_x,float aim_y, float *control)
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


int main(int argc, char** argv){

    float control[4] = {0,0,0,0};        // 1.线速度 2.位置误差 3.角速度 4.角误差
    geometry_msgs::Twist Vel;

    ros::init(argc, argv, "simple_move");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/mogoal",100,get_goal_callback);                       //避免与move base冲突，用mogoal
    ros::Publisher pub = n.advertise<geometry_msgs::Twist>("cmd_vel_mux/input/navi", 100);
    tf::TransformListener pose_transform(ros::Duration(5));
    ros::Timer listner_rate=n.createTimer(ros::Duration(0.05),boost::bind(&transformPoint, boost::ref(pose_transform)));
    ros::Rate r(20);
    sleep(2);
    while (ros::ok()){
        distance_2 = 1000;

        if(sub.getNumPublishers() != 0){
            do{
                ros::spinOnce();                //角度控制
                Rotation(x_l,y_l,goal_x,goal_y,goal_angle,curr_angle,control,false);  
                Vel.linear.x = 0;
                Vel.angular.z = control[2];
                pub.publish(Vel);
                r.sleep();
                }while(fabs(control[3])>= 0.01);           //单次控制 角度误差小于0.01 
            Vel.angular.z = 0;
            sleep(1);

            ROS_INFO_STREAM("ROTATE FINISH!");   
            do{
                ros::spinOnce();                //直线行走
                Go(x_l,y_l,goal_x,goal_y,control);
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
            } 
        ros::spinOnce();
        r.sleep();

        if ( control[1]<=0.01){
            ROS_INFO("IN POSITION!");               //位置基本吻合，跳出行动控制，返回完成信息。
            break;
        }
    }
    do{
        ros::spinOnce();                //获取/goal的目标点，保存到本地
        Rotation(x_l,y_l,goal_x,goal_y,goal_angle,curr_angle,control,true);  
        Vel.angular.z = control[2];
        pub.publish(Vel);
        r.sleep();
        }while(fabs(control[3])>= 0.001);           //单次控制 角度误差小于0.01  
        Vel.angular.z = 0; 
    ROS_INFO("ALL DONE!");
  return 0;
}
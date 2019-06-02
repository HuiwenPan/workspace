// ros libraries 
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Point.h>
#include <tf/transform_listener.h>
#include <vector>

// service header files
#include "move_control/DesiredPose.h"
#include "move_control/ImgPoint.h"

// C++ libraries
#include <cmath>

using namespace std;

class Movement
{
private:
  ros::NodeHandle nh_;
  // NodeHandle in the private namespace
  ros::NodeHandle priv_nh_;
  // service-server and corresponding callback-functions
  ros::ServiceServer move_to_obj_srv, move_to_goal_srv;
  bool moveToObjCb(move_control::ImgPoint::Request &req, move_control::ImgPoint::Response &res);
  bool moveToGoalCb(move_control::DesiredPose::Request &req, move_control::DesiredPose::Response &res);
  // velocity publisher to the robot
  ros::Publisher vel_pub;
  // subscriber of the object point in image
  ros::Subscriber object_sub;
  ros::Subscriber goal_sub;
  void detectCb(const geometry_msgs::Point::ConstPtr& msg);
  void getGoalCb(const geometry_msgs::Pose2D::ConstPtr& goal);
  // private variables used in this class
  geometry_msgs::Point object_pos;
  geometry_msgs::Pose2D goal_pose;
  geometry_msgs::Twist vel_msg;
  geometry_msgs::Twist vel_msg_goal;
  // flag will be activated when rotation process is finished
  int flag_rotation;
  double dist_threshold;
  double control_vel, pos_error, control_rot, ang_error;
  double distance_old, distance_now;
  ros::Time t_start;
  // control functions
  void rotation(float curr_x, float curr_y, float aim_x, float aim_y, float final_ang, float curr_ang, double control_rot, double ang_error, bool final_adjust);
  void translation(float curr_x, float curr_y, float aim_x,float aim_y, double control_vel, double pos_error);
  
  
public:
  Movement(ros::NodeHandle nh) : nh_(nh), priv_nh_("~")
  {
	ROS_INFO("Starting movement services!");
	move_to_obj_srv = nh_.advertiseService("movement/to_obj", &Movement::moveToObjCb, this);
	move_to_goal_srv = nh_.advertiseService("movement/to_goal", &Movement::moveToGoalCb, this);
	vel_pub = nh_.advertise<geometry_msgs::Twist>("cmd_vel_mux/input/navi", 100);
	object_sub = nh_.subscribe("goal_point", 10, &Movement::detectCb, this);
	goal_sub = nh_.subscribe("move_goal", 10, &Movement::getGoalCb, this);
	ROS_INFO("Movement servers are running!");

	flag_rotation = 0;
	dist_threshold = 0.1;

  }
  ~Movement() {}
};

void Movement::detectCb(const geometry_msgs::Point::ConstPtr& msg)
{
  object_pos.x = msg->x;
  object_pos.z = msg->y;
}

bool Movement::moveToObjCb(move_control::ImgPoint::Request &req, move_control::ImgPoint::Response &res)
{
  double d_last = 0;
  double distance = 0;
  ros::Rate loop_rate(20);

  while (ros::ok())
  {
    // first only consider rotation
	if (object_pos.x > 50)
	{
	  vel_msg.angular.z = -0.12;	
	}
	else if (object_pos.x < -50)
	{
	  vel_msg.angular.z = 0.12;
	}
	else
	{
	  vel_msg.angular.z = 0;
	  flag_rotation = 1;
	}

	if ((flag_rotation == 1) && (distance == 0))
	{
	  t_start = ros::Time::now();	
	}

	//ROS_INFO("Rotation verlocity is: %f with error: %f", vel_msg.angular.z, object_pos.x);

	// update the destination coordinates only once
    if ((object_pos.z < 3) && (distance == 0) && (fabs(object_pos.z - d_last) < dist_threshold) && (flag_rotation == 1)){
	  distance = object_pos.z;
	}

	// second only consider the translation 
	if (flag_rotation == 1)
	{
	  double t_run = distance / 0.1 + 2;
	  ROS_INFO("t_run: %f", t_run);
	  
	  if ((ros::Time::now() - t_start).toSec() < t_run)
	  {
		vel_msg.linear.x = 0.1;
		ROS_INFO("Time interval: %f", (ros::Time::now() - t_start).toSec());
	  }
	  else
	  {
		vel_msg.linear.x = 0;
		break;
	  }
	}

	//ROS_INFO("Translation verlocity is: %f", vel_msg.linear.x);
	vel_pub.publish(vel_msg);

    d_last = object_pos.z;
    //ros::spinOnce();
	loop_rate.sleep();	  
  }

  res.finish = true;
  return true;
}


void Movement::getGoalCb(const geometry_msgs::Pose2D::ConstPtr& goal)
{
  goal_pose.x = goal->x;
  goal_pose.y = goal->y;
  goal_pose.theta = goal->theta;
  if (goal_pose.theta < 0){
    goal_pose.theta = goal_pose.theta + 2 * M_PI;
  }
}

void Movement::rotation(float curr_x, float curr_y, float aim_x, float aim_y, float final_ang, float curr_ang, double control_rot, double ang_error, bool final_adjust)
{
    float aim_ang, ang_ctrl, error_ang, det_x, det_y, dist;
    det_x = aim_x - curr_x;
    det_y = aim_y - curr_y;
    dist = sqrt(det_x * det_x + det_y * det_y);

    if (det_y >= 0 && det_x >= 0)
      {aim_ang = asin(det_y / dist);}
    else if (det_y >= 0 && det_x < 0)
      {aim_ang = M_PI - asin(det_y / dist);}
    else if (det_y < 0 && det_x >= 0)
      {aim_ang = 2 * M_PI - asin(fabs(det_y) / dist);}
    else
      {aim_ang = M_PI + asin(fabs(det_y) / dist);}

    if (final_adjust){
      aim_ang = final_ang;
    }
    
    error_ang = aim_ang - curr_ang;

    ang_ctrl = 0.3;

    if (fabs(error_ang) < 5 * M_PI / 3 && fabs(error_ang) > M_PI / 3)
      {ang_ctrl = 0.8;} 
    if (fabs(error_ang) < 0.1 || fabs(error_ang) > 2 * M_PI){
      ang_ctrl = 0.05;
    }                 

    if (error_ang > 0) {
      if (error_ang > M_PI){
        ang_ctrl = - ang_ctrl;
      }
	}
    else
    {
      if (error_ang > -M_PI){
        ang_ctrl = -ang_ctrl;
      }
    }
      
    control_rot = ang_ctrl;
    ang_error = error_ang;
}

void Movement::translation(float curr_x, float curr_y, float aim_x,float aim_y, double control_vel, double pos_error)
{
    float error_pose = 0;
    float vel, det_x, det_y;

    det_x = aim_x - curr_x;
    det_y = aim_y - curr_y;

    error_pose = sqrt(det_x * det_x + det_y * det_y);

    if (error_pose < 2 && error_pose > 0.8) {
        vel = 0.2;
    }     
    else if (error_pose < 0.3) {
        vel = 0.05;
    }
    else {
    vel = 0.1;
	}
    
    control_vel = vel;
    pos_error = error_pose;
    distance_old = error_pose;
}

bool Movement::moveToGoalCb(move_control::DesiredPose::Request &req, move_control::DesiredPose::Response &res)
{
  double x_l, y_l, angle_l;
  double error_distance;
  ros::Rate r(20);
  while (ros::ok()){
    distance_now = 1000;

    if(goal_sub.getNumPublishers() != 0){
      do{
        Movement::rotation(x_l, y_l, goal_pose.x, goal_pose.y, goal_pose.theta, angle_l, control_rot, ang_error, false);  
        vel_msg_goal.linear.x = 0;
        vel_msg_goal.angular.z = control_rot;
        vel_pub.publish(vel_msg_goal);
        r.sleep();
      }while(fabs(ang_error) >= 0.01); 
            
	  vel_msg_goal.angular.z = 0;
      ros::Duration(0.5).sleep();

      ROS_INFO("ROTATE FINISH!");   
      do{
        Movement::translation(x_l, y_l, goal_pose.x, goal_pose.y, control_vel, pos_error);
        vel_msg_goal.angular.z = 0;
        vel_msg_goal.linear.x = control_vel;
        vel_pub.publish(vel_msg_goal);
                
        error_distance = distance_old - distance_now;
        distance_now = distance_old;
        if (error_distance > 0.02){
          break;
		}
	    r.sleep();
      }while(pos_error >= 0.05);
      ROS_INFO("TRANSLATION FINISH!");       
      vel_msg_goal.linear.x = 0;
    } 

    if ( pos_error <= 0.05){
      ROS_INFO("IN POSITION!");
      break;
    }
  }

  res.finish = true;
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "movement");
  ros::NodeHandle nh;
  Movement node(nh);
  ros::spin();
  return 0;
}





















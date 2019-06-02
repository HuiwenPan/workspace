// ROS headers
#include <ros/ros.h>
#include <std_srvs/Empty.h>
#include <geometry_msgs/Twist.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>

// MoveIt! headers
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/move_group_interface/move_group.h>

// Std C++ headers
#include <string>
#include <vector>
#include <map>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

int main(int argc, char** argv){
  ros::init(argc, argv, "move_table");
  ros::NodeHandle n;
  ros::Rate r(10);
  ros::AsyncSpinner spinner(1);
  spinner.start();

  std::map<std::string, double> target_position_1, target_position_2, target_position_3, target_position_4;

  target_position_1["torso_lift_joint"] = 0.14;
  target_position_1["arm_1_joint"] = 0.25;
  target_position_1["arm_2_joint"] = -1.12;
  target_position_1["arm_3_joint"] = -1.68;
  target_position_1["arm_4_joint"] = 1.50;
  target_position_1["arm_5_joint"] = -1.37;
  target_position_1["arm_6_joint"] = 0.03;
  target_position_1["arm_7_joint"] = 0.41;

  target_position_2["torso_lift_joint"] = 0.35;
  target_position_2["arm_1_joint"] = 0.25;
  target_position_2["arm_2_joint"] = -1.12;
  target_position_2["arm_3_joint"] = -1.68;
  target_position_2["arm_4_joint"] = 1.50;
  target_position_2["arm_5_joint"] = -1.37;
  target_position_2["arm_6_joint"] = 0.03;
  target_position_2["arm_7_joint"] = 0.41;

  target_position_3["torso_lift_joint"] = 0.14;
  target_position_3["arm_1_joint"] = 0.25;
  target_position_3["arm_2_joint"] = -1.12;
  target_position_3["arm_3_joint"] = -1.68;
  target_position_3["arm_4_joint"] = 1.50;
  target_position_3["arm_5_joint"] = -1.37;
  target_position_3["arm_6_joint"] = 0.03;
  target_position_3["arm_7_joint"] = 0.41;

  target_position_4["torso_lift_joint"] = 0.14;
  target_position_4["arm_1_joint"] = 0.20;
  target_position_4["arm_2_joint"] = -1.34;
  target_position_4["arm_3_joint"] = -0.20;
  target_position_4["arm_4_joint"] = 1.94;
  target_position_4["arm_5_joint"] = -1.57;
  target_position_4["arm_6_joint"] = 1.37;
  target_position_4["arm_7_joint"] = 0.00;
  // rosservice call /global_localization "{}"
  // rosrun key_teleop key_teleop.py
  // rosservice call /move_base/clear_costmaps "{}"
  
  // rosrun rqt_joint_trajectory_controller rqt_joint_trajectory_controller
  ros::Duration(20).sleep(); // sleep for 20 seconds to wait for Arm Tucked. 
  
  ros::ServiceClient client_global = n.serviceClient<std_srvs::Empty>("/global_localization");
  ros::ServiceClient client_clear = n.serviceClient<std_srvs::Empty>("/move_base/clear_costmaps");
  std_srvs::Empty client_srv;
  while(!client_global.call(client_srv)){
    ROS_INFO("Waiting for the /global_localization");
    r.sleep();
  }
  
  // make the robot rotate about itself to converge to the right pose estimate
  ros::Publisher pub = n.advertise<geometry_msgs::Twist>("/mobile_base_controller/cmd_vel",1); 
  geometry_msgs::Twist msg;
  msg.angular.z = 0.5;
  ros::Time time_start = ros::Time::now();
  while(ros::Time::now() - time_start < ros::Duration(10)){
    ROS_INFO("make the robot rotate about itself to converge to the right pose estimate");
    pub.publish(msg);
  }
 
  while(!client_clear.call(client_srv)){
    ROS_INFO("Waiting for the /move_base/clear_costmaps");
    r.sleep();
  }
  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }

  while(ros::ok()){

    //we'll send a goal_A to the robot
    move_base_msgs::MoveBaseGoal goal_A;
    goal_A.target_pose.header.frame_id = "map";
    goal_A.target_pose.header.stamp = ros::Time::now();

    goal_A.target_pose.pose.position.x = -2.9;
    goal_A.target_pose.pose.position.y = -2.35;
    goal_A.target_pose.pose.orientation.w = 1.0;

    ROS_INFO("Sending goal");
    ac.sendGoal(goal_A);
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
      ROS_INFO("SUCCEEDED! Got Point A!");
    else
      ROS_INFO("FAILED! Can not get Point A!");

    //we'll send a goal_B to the robot
    move_base_msgs::MoveBaseGoal goal_B;
    goal_B.target_pose.header.frame_id = "map";
    goal_B.target_pose.header.stamp = ros::Time::now();

    goal_B.target_pose.pose.position.x = -3.9;
    goal_B.target_pose.pose.position.y = -6.4;
    goal_B.target_pose.pose.orientation.w = 1.0;

    ROS_INFO("Sending goal");
    ac.sendGoal(goal_B);
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
      ROS_INFO("SUCCEEDED! Got Point B!");
    else
      ROS_INFO("FAILED! Can not get Point B!");


    //we'll send a goal_C to the robot
    //use "rostopic echo /amcl_pose" to get the desired postion/orientation to lift the table 
    move_base_msgs::MoveBaseGoal goal_C;
    goal_C.target_pose.header.frame_id = "map";
    goal_C.target_pose.header.stamp = ros::Time::now();

    goal_C.target_pose.pose.position.x = -1.15;
    goal_C.target_pose.pose.position.y = -11.85;
    goal_C.target_pose.pose.orientation.z = 0.69;
    goal_C.target_pose.pose.orientation.w = 0.723;

    ROS_INFO("Sending goal");
    ac.sendGoal(goal_C);
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
      ROS_INFO("SUCCEEDED! Got Point C!");
    else
      ROS_INFO("FAILED! Can not get Point C!");
    
    // Lift the table at position C
    std::vector<std::string> torso_arm_joint_names;
    //select group of joints
    moveit::planning_interface::MoveGroup group_arm_torso("arm_torso");
    //choose your preferred planner
    group_arm_torso.setPlannerId("SBLkConfigDefault");
    torso_arm_joint_names = group_arm_torso.getJoints();
    group_arm_torso.setStartStateToCurrentState();
    group_arm_torso.setMaxVelocityScalingFactor(1.0);
    
    // target_position_1
    for (unsigned int i = 0; i < torso_arm_joint_names.size(); ++i)
      if ( target_position_1.count(torso_arm_joint_names[i]) > 0 )
      {
        ROS_INFO_STREAM("\t" << torso_arm_joint_names[i] << " goal position: " << target_position_1 [torso_arm_joint_names[i]]);
        group_arm_torso.setJointValueTarget(torso_arm_joint_names[i], target_position_1[torso_arm_joint_names[i]]);
      }

    moveit::planning_interface::MoveGroup::Plan my_plan_1;
    group_arm_torso.setPlanningTime(5.0);
    moveit::planning_interface::MoveItErrorCode success_1 = group_arm_torso.plan(my_plan_1);
    if ( !success_1 )
      throw std::runtime_error("No plan found");
    ROS_INFO_STREAM("Plan found in " << my_plan_1.planning_time_ << " seconds");
    // Execute the plan
    ros::Time start = ros::Time::now();
    group_arm_torso.move();
    ROS_INFO_STREAM("Motion duration: " << (ros::Time::now() - start).toSec());
    
    // target_position_2
    for (unsigned int i = 0; i < torso_arm_joint_names.size(); ++i)
      if ( target_position_2.count(torso_arm_joint_names[i]) > 0 )
      {
        ROS_INFO_STREAM("\t" << torso_arm_joint_names[i] << " goal position: " << target_position_2 [torso_arm_joint_names[i]]);
        group_arm_torso.setJointValueTarget(torso_arm_joint_names[i], target_position_2[torso_arm_joint_names[i]]);
      }

    moveit::planning_interface::MoveGroup::Plan my_plan_2;
    group_arm_torso.setPlanningTime(5.0);
    moveit::planning_interface::MoveItErrorCode success_2 = group_arm_torso.plan(my_plan_2);
    if ( !success_2 )
      throw std::runtime_error("No plan found");
    ROS_INFO_STREAM("Plan found in " << my_plan_2.planning_time_ << " seconds");
    // Execute the plan
    ros::Time start_2 = ros::Time::now();
    group_arm_torso.move();
    ROS_INFO_STREAM("Motion duration: " << (ros::Time::now() - start_2).toSec());

    // target_position_3
    for (unsigned int i = 0; i < torso_arm_joint_names.size(); ++i)
      if ( target_position_3.count(torso_arm_joint_names[i]) > 0 )
      {
        ROS_INFO_STREAM("\t" << torso_arm_joint_names[i] << " goal position: " << target_position_3 [torso_arm_joint_names[i]]);
        group_arm_torso.setJointValueTarget(torso_arm_joint_names[i], target_position_3[torso_arm_joint_names[i]]);
      }

    moveit::planning_interface::MoveGroup::Plan my_plan_3;
    group_arm_torso.setPlanningTime(5.0);
    moveit::planning_interface::MoveItErrorCode success_3 = group_arm_torso.plan(my_plan_3);
    if ( !success_3 )
      throw std::runtime_error("No plan found");
    ROS_INFO_STREAM("Plan found in " << my_plan_3.planning_time_ << " seconds");
    // Execute the plan
    ros::Time start_3 = ros::Time::now();
    group_arm_torso.move();
    ROS_INFO_STREAM("Motion duration: " << (ros::Time::now() - start_3).toSec());

    //target_position_4
    for (unsigned int i = 0; i < torso_arm_joint_names.size(); ++i)
      if ( target_position_4.count(torso_arm_joint_names[i]) > 0 )
      {
        ROS_INFO_STREAM("\t" << torso_arm_joint_names[i] << " goal position: " << target_position_4 [torso_arm_joint_names[i]]);
        group_arm_torso.setJointValueTarget(torso_arm_joint_names[i], target_position_4[torso_arm_joint_names[i]]);
      }

    moveit::planning_interface::MoveGroup::Plan my_plan_4;
    group_arm_torso.setPlanningTime(5.0);
    moveit::planning_interface::MoveItErrorCode success_4 = group_arm_torso.plan(my_plan_4);
    if ( !success_4 )
      throw std::runtime_error("No plan found");
    ROS_INFO_STREAM("Plan found in " << my_plan_4.planning_time_ << " seconds");
    // Execute the plan
    ros::Time start_4 = ros::Time::now();
    group_arm_torso.move();
    ROS_INFO_STREAM("Motion duration: " << (ros::Time::now() - start_4).toSec());
  }
  
    
  return 0;
}


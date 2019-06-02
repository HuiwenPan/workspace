/*********************************************************************
* STD INCLUDES
********************************************************************/
#include <iostream>
#include <fstream>
#include <map>
#include <string>


/*********************************************************************
* ROS INCLUDES
********************************************************************/
#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base/move_base.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <std_srvs/Empty.h>
#include <geometry_msgs/Twist.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/move_group_interface/move_group.h>





typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MovebaseClient;




/*********************************************************************
* Lift_table
********************************************************************/
bool lift_table(std::map<std::string, double> &target_position){

    std::vector<std::string> torso_arm_joint_names;
    moveit::planning_interface::MoveGroupInterface group_arm_torso("arm_torso");
    group_arm_torso.setPlannerId("SBLkConfigDefault");
    torso_arm_joint_names = group_arm_torso.getJoints();
    group_arm_torso.setStartStateToCurrentState();
    group_arm_torso.setMaxVelocityScalingFactor(1.0);
    
    for (unsigned int i = 0; i < torso_arm_joint_names.size(); ++i)
      if ( target_position.count(torso_arm_joint_names[i]) > 0 )
      {
        ROS_INFO_STREAM("\t" << torso_arm_joint_names[i] << " goal position: " << target_position [torso_arm_joint_names[i]]);
        group_arm_torso.setJointValueTarget(torso_arm_joint_names[i], target_position[torso_arm_joint_names[i]]);
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


    return EXIT_SUCCESS;

}



/*********************************************************************
* Main
********************************************************************/

int main(int argc, char** argv){

    ros::init(argc, argv, "tiago_navigation");
    ros::NodeHandle n;
    ros::Rate rate(5);


/*********************************************************************
*Parameter Initiallization
********************************************************************/
    move_base_msgs::MoveBaseGoal Path[3];
    std::map<std::string, double> target_position[4];

    target_position[0]["torso_lift_joint"] = 0.14;
    target_position[0]["arm_1_joint"] = 0.25;
    target_position[0]["arm_2_joint"] = -1.12;
    target_position[0]["arm_3_joint"] = -1.68;
    target_position[0]["arm_4_joint"] = 1.50;
    target_position[0]["arm_5_joint"] = -1.37;
    target_position[0]["arm_6_joint"] = 0.03;
    target_position[0]["arm_7_joint"] = 0.41;

    target_position[1]["torso_lift_joint"] = 0.35;
    target_position[1]["arm_1_joint"] = 0.25;
    target_position[1]["arm_2_joint"] = -1.12;
    target_position[1]["arm_3_joint"] = -1.68;
    target_position[1]["arm_4_joint"] = 1.50;
    target_position[1]["arm_5_joint"] = -1.37;
    target_position[1]["arm_6_joint"] = 0.03;
    target_position[1]["arm_7_joint"] = 0.41;

    target_position[2]["torso_lift_joint"] = 0.14;
    target_position[2]["arm_1_joint"] = 0.25;
    target_position[2]["arm_2_joint"] = -1.12;
    target_position[2]["arm_3_joint"] = -1.68;
    target_position[2]["arm_4_joint"] = 1.50;
    target_position[2]["arm_5_joint"] = -1.37;
    target_position[2]["arm_6_joint"] = 0.03;
    target_position[2]["arm_7_joint"] = 0.41;

    target_position[3]["torso_lift_joint"] = 0.14;
    target_position[3]["arm_1_joint"] = 0.20;
    target_position[3]["arm_2_joint"] = -1.34;
    target_position[3]["arm_3_joint"] = -0.20;
    target_position[3]["arm_4_joint"] = 1.94;
    target_position[3]["arm_5_joint"] = -1.57;
    target_position[3]["arm_6_joint"] = 1.37;
    target_position[3]["arm_7_joint"] = 0.00;

    Path[0].target_pose.header.frame_id = "map";
    Path[0].target_pose.header.stamp = ros::Time::now();
    Path[0].target_pose.pose.position.x = -2.5;
    Path[0].target_pose.pose.position.y = -2.4;
    Path[0].target_pose.pose.orientation.w = 1;
    Path[1].target_pose.header.frame_id = "map";
    Path[1].target_pose.header.stamp = ros::Time::now();
    Path[1].target_pose.pose.position.x = -4;
    Path[1].target_pose.pose.position.y = -6.4;
    Path[1].target_pose.pose.orientation.w = 1;
    Path[2].target_pose.header.frame_id = "map";
    Path[2].target_pose.header.stamp = ros::Time::now();
    Path[2].target_pose.pose.position.x = -1;
    Path[2].target_pose.pose.position.y = -11.8;
    Path[2].target_pose.pose.orientation.w = 0.707;
    Path[2].target_pose.pose.orientation.z = 0.707;

/*    ROS_INFO("waiting for arm tucked");
    for (int i=0; i<60; i++){
	rate.sleep();
    }*/
/*********************************************************************
*Localization
********************************************************************/

    ros::ServiceClient global_localization = n.serviceClient<std_srvs::Empty>("global_localization");
    ros::ServiceClient clear_costmaps = n.serviceClient<std_srvs::Empty>("/move_base/clear_costmaps");
    std_srvs::Empty Req;
    
    while (!global_localization.call(Req)){
        ROS_INFO("waiting for Global_localizing++++++++++++++++++++++++++++++++");
        rate.sleep();
    }


    ros::Publisher rotate_around = n.advertise<geometry_msgs::Twist>("mobile_base_controller/cmd_vel",1);
    MovebaseClient loca_client(n, "move_base", true);
    if(!loca_client.waitForServer(ros::Duration(10))){
        ROS_INFO("Localization: Cannot connected to move_base action server!");
    }


    ros::Time t_start;
    t_start = ros::Time::now();
    geometry_msgs::Twist rotate_vel;
    rotate_vel.angular.z = 0.3;
    while((ros::Time::now() - t_start) < ros::Duration(20)){
    	rotate_around.publish(rotate_vel);
    	ros::spinOnce();
    }

    while (!clear_costmaps.call(Req)){
        ROS_INFO("waiting for clear costmaps &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        rate.sleep();
    }


/*    move_base_msgs::MoveBaseGoal rotate_goal;
    rotate_goal.target_pose.header.frame_id = "base_link";
    rotate_goal.target_pose.header.stamp = ros::Time::now();
    for(int i=0; i<4; i++){
        switch(i){
            case 0:{
                rotate_goal.target_pose.pose.orientation.w = 0.707;
                rotate_goal.target_pose.pose.orientation.z = 0.707;
            }
            case 1:{
                rotate_goal.target_pose.pose.orientation.z = 1;
            }
            case 2:{
                rotate_goal.target_pose.pose.orientation.w = -0.707;
                rotate_goal.target_pose.pose.orientation.z = 0.707;
            }
            case 3:{
                rotate_goal.target_pose.pose.orientation.w = 1;
            }
        }

        loca_client.sendGoal(rotate_goal);
        loca_client.waitForResult();
        if (loca_client.getState()==actionlib::SimpleClientGoalState::SUCCEEDED){
            ROS_INFO("rotate %d time", i);
            rotate_goal.target_pose.pose.orientation.w = 0;
            rotate_goal.target_pose.pose.orientation.z = 0;
        }
    }*/


/*********************************************************************
* Navigation
********************************************************************/
    MovebaseClient nav_client(n, "move_base", true);
    ROS_INFO("Waiting for the move_base action server");
    if(!nav_client.waitForServer(ros::Duration(20))){
        ROS_INFO("Cannot connected to move_base action server!");
    }
    
    ROS_INFO("Sending goal");
    while(ros::ok()){
    	for(int i=0; i < sizeof(Path)/sizeof(Path[0]); i++){
	
	    	nav_client.sendGoal(Path[i]);
	    	nav_client.waitForResult(ros::Duration(35));
	    	if(nav_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
	        ROS_INFO("reached the goal %d", i);
            if(i == 3){
                for(std::map<std::string, double> target_pos : target_position )
                lift_table(target_pos);
                }
	    	}
  	    }
    }
    return 0;
}



#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <stdlib.h>
#include "simple_move/simple_moveAction.h"

void doneCb(const actionlib::SimpleClientGoalState&state,
            const simple_move::simple_moveResultConstPtr& result)
            {
                ROS_INFO("finish!");
            }

void activeCb()
{
    ROS_INFO("Action is active!");
}

void feedbackCb(const simple_move::simple_moveFeedbackConstPtr& feedback)
{
    ROS_INFO("Current pose: %f , %f", feedback->current_pose.x, feedback->current_pose.y);
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_move_actionclient");

    if(argc!=4)
    {
        ROS_INFO("number must be 3!");
        ROS_WARN("fuck! I forget it!");
        return 1;
    }
    actionlib::SimpleActionClient<simple_move::simple_moveAction> action_client("simple_move_actionclient",true);
    ROS_INFO("Waiting for action server");
    action_client.waitForServer();
    ROS_INFO("Action server started, sending goal");
    simple_move::simple_moveActionGoal action_goal;
    action_goal.goal.goal_pose.x = atof(argv[1]);
    action_goal.goal.goal_pose.y = atof(argv[2]);
    action_goal.goal.goal_pose.theta = atof(argv[3]);

    action_client.sendGoal(action_goal.goal, &doneCb, &activeCb, &feedbackCb);

    ros::spin();
    return 0;

}
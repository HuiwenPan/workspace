#ifndef TURTLECLASS_H
#define TURTLECLASS_H

/*********************************************************************
* ROS INCLUDES
********************************************************************/
#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/String.h>
#include <tiago_control/DesiredPose.h>
#include <tiago_control/send_desired_pose.h>

/*********************************************************************
* EIGEN INCLUDES
********************************************************************/
#include <Eigen/Eigen>
#include <Eigen/StdVector>
#include <Eigen/Geometry>
#include <Eigen/Core>

using namespace Eigen;

namespace turtleSpace
{
    class TurtleClass
    {
      

    public:

				pthread_mutex_t count_mutex;

        Vector3d turtlepose, turtlepose_g, turtlepose_d;
        
        TurtleClass();
        ~TurtleClass();

				//#>>>>TODO:CREATE A CALLBACK FUNCTION FOR THE TOPIC tiago_control::DesiredPose (SEE TurtleClass.cpp)
        void getPose(const tiago_control::DesiredPose::ConstPtr &msg);
			  
				//#>>>>TODO:CREATE A CALLBACK FUNCTION FOR THE SERVICE tiago_control::send_desired_pose
        bool getDPose(tiago_control::send_desired_pose::Request &req, 
                      tiago_control::send_desired_pose::Response &res);
				//#>>>>TODO:CREATE 2 METHODS TO GET THE DESIRED TURTLE POSE AND CURRENT TURTLE POSE 
        Vector3d getLocalPose();
        Vector3d getLocalDesiredPose();

        void getTiagoPose(const nav_msgs::Odometry::ConstPtr &msg);
    };


}

#endif // TURTLECLASS_H

/*********************************************************************
* Compiler:         gcc 4.6.3
*
* Company:          Institute for Cognitive Systems
*                   Technical University of Munich
*
* Author:           Emmanuel Dean (dean@tum.de)
*                   Karinne Ramirez (karinne.ramirez@tum.de)
*
* Compatibility:    Ubuntu 12.04 64bit (ros hydro)
*
* Software Version: V0.1
*
* Created:          01.06.2015
*
* Comment:          turtle connection and visualization (Sensor and Signals)
*
********************************************************************/


/*********************************************************************
* STD INCLUDES
********************************************************************/
#include <iostream>
#include <fstream>
#include <pthread.h>


/*********************************************************************
* ROS INCLUDES
********************************************************************/
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/String.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <tf_conversions/tf_eigen.h>


/*********************************************************************
* EIGEN INCLUDES
********************************************************************/
#include <Eigen/Eigen>
#include <Eigen/StdVector>
#include <Eigen/Geometry>
#include <Eigen/Dense>
#include <Eigen/Core>

/*********************************************************************
 * CUSTOM CLASS
 * ******************************************************************/
#include <tiago_control/myClass/TurtleClass.h>
#include "tiago_control/DesiredPose.h"


int main( int argc, char** argv )
{

    ros::init(argc, argv, "tiago_control",ros::init_options::AnonymousName);

    ROS_INFO_STREAM("**Publishing tiago control..");

    ros::NodeHandle n;
    ros::Rate r(60);



    //ADVERTISE THE SERVICE
    turtleSpace::TurtleClass turtleF;
    ros::ServiceServer service=n.advertiseService("TiagoPose",
                                                  &turtleSpace::TurtleClass::getDPose,//#>>>>TODO: DEFINE THE CALLBACK FUNCTION,
                                                  &turtleF);
    //CALL SERVICE FROM TERMINAL//
    //    rosservice call /TurtlePose '{p: [0.5, 0.0, 3.0]}'
    //    rosservice call /TurtlePose "{p: {x: 1.5, y: 1.0, theta: 0.0}}"
    //DON'T FORGET TO SOURCE THE WORKSPACE BEFORE CALLING THE SERVICE

    //Subscribe the odom infomation
    ros::Subscriber sub=n.subscribe("/mobile_base_controller/odom", 1, &turtleSpace::TurtleClass::getTiagoPose, &turtleF);

    //ADVERTIZE THE TOPIC
    ros::Publisher pub=n.advertise<geometry_msgs::Twist>("/mobile_base_controller/cmd_vel",1);

    ros::Time ti, tf;
    ti=ros::Time::now();

    //Proportional Gain
    Matrix3d Kp;


    //#>>>>TODO: SET GAINS

    double p_g=0.0;
    double d=0.0;
    //#>>>>TODO: LOAD p_gain FROM THE ROS PARAMETER SERVER 
    
    ros::param::get("/tiago_control/turtle_gains/tiago_gain", p_g);
    ros::param::get("/tiago_control/turtle_gains/d", d);
    ROS_INFO_STREAM("p_g= "<<p_g);
    ROS_INFO_STREAM("d= "<<d);


    //Proportional Gain

    Kp<<p_g,0  ,0,
            0  ,p_g,0,
            0  ,0  ,p_g;

    ROS_INFO_STREAM("Kp= \n"<<Kp);

    Vector3d turtlePose,turtleVel;
    Vector3d error;
    Vector2d T;
    Matrix2d Temp;
    double dt;

    //INITIALIZE THE TURTLE POSE
    turtlePose<<0,0,0;
    turtleVel<<0,0,0;
    
    //DESIRED POSE
    Vector3d turtlePose_desired_local;
    ////#>>>>TODO: INITIALIZE THE DESIRED POSE VARIABLE OF THE CLASS TURTLE
    turtlePose_desired_local << d,0,0;
    turtleF.turtlepose_d = turtlePose_desired_local;


    //CREATE A DESIREDPOSE MSG VARIABLE
    geometry_msgs::Twist msg; //#>>>>TODO:DEFINE THE MSG TYPE

    while(ros::ok())
    {
        tf=ros::Time::now();

        dt=tf.toSec()-ti.toSec();

        ////#>>>>TODO: Get Desired Pose from the class variable

        Temp << cos(turtleF.turtlepose_g[2]), -d*sin(turtleF.turtlepose_g[2]),
                sin(turtleF.turtlepose_g[2]), d*cos(turtleF.turtlepose_g[2]);
        //ROS_INFO_STREAM("Temp= \n"<<Temp);
        turtlePose <<  turtleF.turtlepose_g[0]+ d*cos(turtleF.turtlepose_g[2]), turtleF.turtlepose_g[1]+ d*sin(turtleF.turtlepose_g[2]), turtleF.turtlepose_g[2];
        //CONTROL
        ////#>>>>TODO:COMPUTE THE ERROR BETWEEN CURRENT POSE AND DESIRED
        error= turtlePose - turtleF.turtlepose_d;

        // COMPUTE THE INCREMENTS
        turtleVel=-Kp*error;

        ////#>>>>TODO:COMPUTE THE NEW TURTLE POSE
        //turtlePose= turtlePose_old + turtleVel * dt;
        T = Temp.reverse()  *turtleVel.head(2); 
        //Publish Data
        ////#>>>>TODO:SET THE MSG VARIABLE WITH THE NEW TURTLE POSE
        msg.linear.x = T[0];
        msg.angular.z = T[1];

        pub.publish(msg);

        //SET THE HISTORY
        //turtlePose_old=turtlePose;
        ti=tf;

        //ROS::SPIN IS IMPORTANT TO UPDATE ALL THE SERVICES AND TOPICS
        ros::spinOnce();

        r.sleep();
    }

    return 0;
}



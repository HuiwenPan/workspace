/*********************************************************************
* Compiler:         gcc 4.6.3
*
* Company_d:          Institute for Cognitive Sy_dstems
*                   Technical University_d of Munich
*
* Author:           Emmanuel Dean (dean@tum.de)
*                   Karinne Ramirez (karinne.ramirez@tum.de)
*
* Compatibility_d:    Ubuntu 12.04 64bit (ros hy_ddro)
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
#include <string>


/*********************************************************************
* ROS INCLUDES
********************************************************************/
#include <ros/ros.h>
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
#include <Eigen/Core>

/*********************************************************************
 * SEVICES AND MESSAGES
 * ******************************************************************/
//SET HEADERS FOR THE SERVICE AND THE MESSAGES OF THE tiago_control PACKAGE
#include "tiago_control/send_desired_pose.h"


using namespace Eigen;
using namespace std;

int main(int argc, char** argv)
{

    ros::init(argc, argv, "tiago_set_pos",ros::init_options::AnonymousName);

    ROS_INFO_STREAM("**Client tiago desired position");

    ros::NodeHandle n;
    ros::Rate r(60);

    //INITIALIZE THE CLIENT
    ros::ServiceClient client=n.serviceClient<tiago_control::send_desired_pose>("TiagoPose");

    ////#>>>>TODO: DEFINE A MSG VARIABLE FOR THE SERVICE MESSAGE
    tiago_control::send_desired_pose msg;

    double x_d, y_d, theta_d;

    std::string my_String;

    static tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::Quaternion qtf;

    while(ros::ok())
    {

        std::vector<double> vals;
        int pos_1,pos_2;
        std::string substr_1,substr_2,substr_3;

        ROS_INFO_STREAM("Give me the desired position of the turtle: x,y,0");
        std::cin>>my_String;
        ////#>>>>TODO:GET THE VALUES FROM THE TERMINAL AND SAVE THEM IN A LOCAL VARIABLE. YOU WILL GET x_d,y_d AND theta_d
        if(my_String.size()!=0)
        {
        pos_1 = my_String.find(",");
        pos_2 = my_String.rfind(",");
        substr_1 = my_String.substr(0,pos_1);
        substr_2 = my_String.substr(pos_1+1,(pos_2 - pos_1));
        substr_3 = my_String.substr(pos_2+1);
        x_d = strtod(substr_1.c_str(),NULL);
        y_d = strtod(substr_2.c_str(),NULL);
        theta_d = strtod(substr_3.c_str(),NULL);
        }
        ////#>>>>TODO:CREATE THE MESSAGE WITH THE LOCAL VARIABLE
        msg.request.x = x_d;
        msg.request.y = y_d;
        msg.request.theta = 0;

        ////#>>>>TODO:COMPUTE THE POSITION AND ORIENTATION OF THE TF FOR THE DESIRED POSITION
        qtf.setRPY(0,0,theta_d);
        transform.setOrigin(tf::Vector3(x_d, y_d, 0));
        transform.setRotation(qtf);

        br.sendTransform(tf::StampedTransform(transform,ros::Time::now(),"/world","/turtle_desired"));


        if(client.call(msg))
        {
            //#>>>>TODO:PLOT THE MESSAGE
            ROS_INFO_STREAM("Calling Service 'TurtlePose'");
            ROS_INFO("x_d: %f, y_d: %f, theta_d: %f",x_d,y_d,theta_d);
        }
        else
        {
            ROS_ERROR_STREAM("Failed to call the service 'TurtlePose'");
            return 1;
        }

    }



    return 0;
}

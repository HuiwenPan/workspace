#include<tiago_control/myClass/TurtleClass.h>
#include<tiago_control/DesiredPose.h>

namespace turtleSpace {

TurtleClass::TurtleClass()
{
    //#>>>>TODO: INITIALIZE MEMBER VARIABLES
    turtlepose << 0,0,0;
    turtlepose_g << 0,0,0;
    turtlepose_d << 0,0,0;
    count_mutex = PTHREAD_MUTEX_INITIALIZER;
}
TurtleClass::~TurtleClass()
{

}

void TurtleClass::getPose(const tiago_control::DesiredPose::ConstPtr &msg)
{
    pthread_mutex_lock( &this->count_mutex );
    //#>>>>TODO: COPY THE MSG TO A LOCAL VARIABLE
    turtlepose << msg->x, msg->y, msg->theta;
    
    pthread_mutex_unlock( &this->count_mutex );

    //#>>>>TODO:PLOT THE OBTAINED DATA
    //ROS_INFO("Current position x:%f y:%f theta:%f", msg->x, msg->y, msg->theta);
}

bool TurtleClass::getDPose(tiago_control::send_desired_pose::Request &req, 
                           tiago_control::send_desired_pose::Response &res)
{
    pthread_mutex_lock( &this->count_mutex );
    //#>>>>TODO:COPY THE REQUEST MSG TO A LOCAL VARIABLE
    turtlepose_d << req.x, req.y, req.theta;
    pthread_mutex_unlock( &this->count_mutex );

    //#>>>>TODO:PLOT THE OBTAINED DATA
    ROS_INFO("Get desired position x:%f y:%f theta:%f",req.x, req.y, req.theta);
    res.reply=1;

    return true;
}

Vector3d TurtleClass::getLocalPose()
{
    Vector3d local;
    pthread_mutex_lock( &this->count_mutex );
    //local=this->turtlePose_g;
    local = this -> turtlepose;
    pthread_mutex_unlock( &this->count_mutex );

    return local;
}

Vector3d TurtleClass::getLocalDesiredPose()
{
    Vector3d local;
    pthread_mutex_lock( &this->count_mutex );
    //local=this->turtlePose_desired_g;
    local=this->turtlepose_d;
    pthread_mutex_unlock( &this->count_mutex );

    return local;
}

void TurtleClass::getTiagoPose(const nav_msgs::Odometry::ConstPtr &msg)
{
    pthread_mutex_lock( &this->count_mutex );

    this->turtlepose_g(0)=msg->pose.pose.position.x;
    this->turtlepose_g(1)=msg->pose.pose.position.y;

    Quaterniond q;
    q.x() = msg->pose.pose.orientation.x;
    q.y() = msg->pose.pose.orientation.y;
    q.z() = msg->pose.pose.orientation.z;
    q.w() = msg->pose.pose.orientation.w;

    Vector3d euler = q.toRotationMatrix().eulerAngles(0, 1, 2);

    this->turtlepose_g(2) = euler(2);

    pthread_mutex_unlock( &this->count_mutex );

    ROS_INFO_STREAM("Tiago Pose: "<<this->turtlepose_g.transpose());
}


}

#ifndef QT_CONNECTION_H
#define QT_CONNECTION_H

// Qt libraries
#include <QThread>
#include <QWidget>
#include <QTimer>

// header files
#include "referee.h"
#include "qt_connection/Ready.h"
#include "qt_connection/AbRatio.h"
#include "qt_connection/EgoPos.h"
#include "qt_connection/Color.h"

// ros libraries
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <tf/transform_listener.h>
#include <tf/message_filter.h>
#include <tf/transform_datatypes.h>
#include <tf/transform_broadcaster.h>
#include <message_filters/subscriber.h>
#include <laser_geometry/laser_geometry.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CompressedImage.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>

// opencv libraries
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <cv.h>
#include <highgui.h>

// C++ libraries
#include <iostream>
#include <cmath>
#include <string>
#include <vector>

class Referee;

class ConnectClass : public QThread 
{
  Q_OBJECT
  public:
	//ConnectClass(int argc, char** argv);
	ConnectClass(ros::NodeHandle n);
	~ConnectClass();

	bool init();

	void connectToServer();
	void start_alive_timer();

  //private:
	ros::NodeHandle n_;
 	int init_argc;
	char** init_argv;
	Referee *referee;

	ros::Publisher vel_pub_;;
	ros::Subscriber img_sub_;
	ros::Subscriber odom_sub_;

	void getOdomCb(const nav_msgs::Odometry::ConstPtr& msg);
	void laserCb(const sensor_msgs::LaserScan::ConstPtr& scan_in);
	void color_detection(const sensor_msgs::CompressedImage::ConstPtr& msg);

	int flag, flag_color, fflag, qt_flag, flag_rotation, flag_b;

	int bbx_threshold_ball;
	int bbx_threshold_p_near;
    int bbx_threshold_p_far;

	int p_pixel_1, p_pixel_2, p_pixel_3;

	ros::Time t_start, t_back_start;

	bool finish_a, finish_b, start_tf, start_odom;

	int index_a, index_b, index_v;

	int goal_pixel;
	double distance, goal_depth;

	double a, b, x_robot, y_robot, theta, pillar_x, pillar_y;
    double t0;

	int is_left;

	// value from angelina
	double value_a;
	double value_b;
	std::string color_true; 
	bool game_start;
	bool detection_start;
	bool get_ab_true_value;
	bool game_over;
	bool stop_movement;

	// variable for control strategy
	double control_vel, pos_error, control_rot, ang_error;
	double distance_before, distance_now ,distance_diff;
	geometry_msgs::Pose2D goal_pose;
	geometry_msgs::Pose2D current_pose;
	bool flag_move;
	int goal_count;
	bool final_adjust;
    bool rotation_move;

	// functions for control strategy
    void rotation(double curr_x, double curr_y, double aim_x, double aim_y, double final_ang, double curr_ang, bool final_adjust);
    void translation(double curr_x, double curr_y, double aim_x,double aim_y);
	void simple_move_path();
    
	geometry_msgs::Twist velocity;
    geometry_msgs::Pose2D pose_odom;

	laser_geometry::LaserProjection projector_;
  	tf::TransformListener listener_;
    message_filters::Subscriber<sensor_msgs::LaserScan> laser_sub_;
  	tf::MessageFilter<sensor_msgs::LaserScan> laser_notifier_;
	
    tf::TransformBroadcaster br;
	tf::Transform transform;
    tf::TransformListener listener_map;
    tf::StampedTransform transform_map;
	tf::TransformListener listener_map_local;

	geometry_msgs::PoseStamped local_turtlepose;
	geometry_msgs::PoseStamped global_turtlepose;
  	

  public slots:
	void slotGameStart();
	void slotDetectionStart();
	void slotGameOver();
	void slotAbValues(double a, double b);
	void slotStopMovement();
	void slotTeamColor(TeamColor);
	void slotSendAlive();

};
#endif

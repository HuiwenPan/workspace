#include <QApplication>
#include "qt_connection.h"

#include <iostream>

class Referee;

int main(int argc, char **argv) {

  QApplication app(argc, argv);

  ros::init(argc, argv, "angelina_connection");
  ros::NodeHandle n;
  
  //ros::AsyncSpinner spinner(4);
  //spinner.start();
  ConnectClass qt_conn(n);

  ROS_WARN_STREAM("Connecting to server...");

  qt_conn.connectToServer();
  qt_conn.start_alive_timer();

  app.processEvents();

  ros::Rate loop_rate(30);
  while (ros::ok())
  {     
  	app.processEvents();
  	ros::spinOnce();
  	loop_rate.sleep();
  }

  int result = app.exec();

  //ros::waitForShutdown();
  return result;
}

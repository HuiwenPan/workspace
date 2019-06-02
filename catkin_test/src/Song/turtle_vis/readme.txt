This is the package turtle_vis, it include five node:
node 1: Control_node;
node 2: Turtle_set_position;
node 3: turele_vis_node;
node 4: static Transformation;
node 5: rviz;

Here are the steps to run the package:
1) copy the package the workspace
2) compile the package:
                        catkin_make
                        source devel/setup.bash
3) launch the nodes:
                        roslaunch turtle_vis TurtleVis.launch
4) call the service:
                        rosservice call /TurtlePose "x_d:XXX 
                                                     y_d:xxx
                                                     theta:xxx"
5) run the node 2:
                        rosrun turtle_vis turtle_set_position
   then here is a ROS_INFO:Give me the desired position of the turtle: x,y,theta
   you can write the desird position, and you will see the movement of turtle in the rviz.


thank for your test!


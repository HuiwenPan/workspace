1. Type the command line in terminal as: roslaunch turtle_vis TurtleVis.launch

2. There should exist /turtle frame, /world frame and /map frame in rviz.

3. Open a new terminal and source to the /your workspace/devel/setup.bash

4. Type the command line as: rosrun turtle_vis turtle_set_pos

5. Input the desired position in the required format

6. If you want to see the current position info, please uncomment 28 line in TurtleClass.cpp.

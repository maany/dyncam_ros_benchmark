#!/bin/bash

#set up environment
echo "Setting up environment..."
source "/opt/ros/lunar/setup.bash"
source "/catkin_ws/devel/setup.bash"


# start roscore
echo "starting roscore..."
roscore 

# start ros_kinect_bridge
#echo "starting ros_kinect_bridge..."
#roslaunch kinect2_bridge kinect2_bridge.launch

# start viewer
#echo "starting viewer..."
#rosrun kinect2_viewer kinect2_viewer kinect2 sd cloud.
 
exec "$@"

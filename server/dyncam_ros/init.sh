#!/bin/bash

#set up environment
echo "Setting up environment..."
source "/opt/ros/lunar/setup.bash"
source "/catkin_ws/devel/setup.bash"

#set up ros network info
echo "Setting up ros network info"
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
export ROS_IP=127.0.0.1

# start roscore
echo "starting roscore..."
roscore 

#start ros_kinect_bridge
echo "starting ros_kinect_bridge..."
roslaunch kinect2_bridge kinect2_bridge.launch
 
exec "$@"


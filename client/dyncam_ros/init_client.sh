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

# start viewer
echo "starting viewer..."
rosrun kinect2_viewer kinect2_viewer kinect2 sd image
 
#exec "$@"

#while true; do sleep 1000; done

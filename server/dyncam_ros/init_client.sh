#!/bin/bash

#set up environment
echo "Setting up environment..."
source "/opt/ros/lunar/setup.bash"
source "/catkin_ws/devel/setup.bash"

# start viewer
echo "starting viewer..."
rosrun kinect2_viewer kinect2_viewer kinect2 sd $STREAM_TYPE

exec "$@"


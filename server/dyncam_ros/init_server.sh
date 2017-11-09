#!/bin/bash

#set up environment
echo "Setting up environment..."
source "/opt/ros/lunar/setup.bash"
source "/catkin_ws/devel/setup.bash"

# start roscore
echo "starting roscore..."
roscore &

echo "Sleep 10s before starting kinect_bridge"
sleep 10s
echo "Starting kinect bridge"

#start ros_kinect_bridge
echo "starting ros_kinect_bridge..."
roslaunch kinect2_bridge kinect2_bridge.launch 
exec "$@"


###############################################################################################
# 1.Introduction
# ==============
#
# This script will start a docker container for dyncam_ros_benchmark_client image. 
# Use it on the machine that has kinect plugged in and is connected to a network to which kinect's data will be streamed.
# This container will view the contents being streamed to the clients.
#
# 2.Pre-requisites
# ================
#
# Install Docker on this machine
#
# 3.Usage
# =======
#
# run_local_clients.sh [OPTIONS]
#
# 4.Description of OPTIONS
# =========================
#
# (a) --type [color|depth|image|cloud|all] : value can be either 'depth', 'color', 'image', 'cloud' or 'all'. 
# 		(i)   'depth' open a window for viewing depth stream only
# 		(ii)  'color' open a window for viewing color stream only
#		(iii) 'image' will display a color and depth matrices in separate OpenCV windows.	     
#		(iv)  'cloud' will open up a opencv named window displaying the point cloud. 
# 		(v)   'all' will display 3 opencv windows, one for color stream, depth stream and point cloud respectively 
# 5. Example
# ===========
#
# run_local_client.sh --type=cloud
#
###############################################################################################
echo "Enabling sharing of display between container and host."
sudo xhost +local:root #enable sharing of access control list

for i in "$@"
do
case $i in
    -t=*|--type=*)
    STREAM_TYPE="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

#!/bin/bash
sudo docker run -it \
  --name=local_client \
  --rm \
  --mount type=bind,source=$(pwd)/dyncam_ros,target=/dyncam_ros \
  --net host \
  --privileged \
  -e STREAM_TYPE="${STREAM_TYPE}" \
  -e DISPLAY=$DISPLAY \
  -e ROS_MASTER_URI="http://localhost:11311" \
  -e ROS_HOSTNAME="localhost" \
  -e ROS_IP="127.0.0.1" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/bus/usb:/dev/bus/usb \
  maany/dyncam_ros_benchmark_client \
  /bin/bash

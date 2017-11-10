###############################################################################################
# 1.Introduction
# ==============
#
# This script will start a docker container for dyncam_ros_benchmark_client image. 
# Use it on the machine serving as a receiver/client for the streamed data.
#
# 2.Pre-requisites
# ================
#
# Install Docker on this machine
# Make sure a container for dyncam_ros_benchmark_server is running on a different machine on the same network.
#
# 3.Usage
# =======
#
# run_client.sh [OPTIONS]
#
# 4.Description of OPTIONS
# =========================
#
# (a) --host : IP address or hostname of this machine on the network    
# (b) --master : IP address of the machine where ros master is running. i.e IP address of the server machine to which kinect is connected. 
# (c) --ip : IP address of this machine
# (d) --type [cloud|image] : value can be either 'cloud' or 'image'. 'cloud' will open up a opencv named window displaying the point cloud. 'image' will display a fused matrix of color and depth matrices. 
# 
# 5. Example
# ===========
# 
# run_client.sh --host=localhost --master=192.168.2.101 --ip=192.168.2.100 --type=cloud
#
###############################################################################################

echo "Enabling sharing of display between container and host."
xhost +local:root #enable sharing of access control list

for i in "$@"
do
case $i in
    --host=*)
    HOST="${i#*=}"
    shift # past argument=value
    ;;
    -m=*|--master=*)
    MASTER="${i#*=}"
    shift # past argument=value
    ;;
    -i=*|--ip=*)
    IP="${i#*=}"
    shift # past argument=value
    ;;
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
echo "The following parameters will be used to configure ROS network to connect to Dyncam Benchmark Server :"
echo "ROS_HOST       = ${HOST}"
echo "ROS_MASTER_URL = ${MASTER}"
echo "ROS_IP         = ${IP}"
echo "TYPE           = ${STREAM_TYPE}"

sudo docker run -it \
  --name=client \
  --rm \
  --mount type=bind,source=$(pwd)/dyncam_ros,target=/dyncam_ros \
  --net host \
  --privileged \
  -e STREAM_TYPE="${STREAM_TYPE}" \
  -e DISPLAY=$DISPLAY \
  -e ROS_MASTER_URI="http://${MASTER}:11311" \
  -e ROS_HOSTNAME="${HOST}" \
  -e ROS_IP="${IP}" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/bus/usb:/dev/bus/usb \
  maany/dyncam_ros_benchmark_client \
  /bin/bash


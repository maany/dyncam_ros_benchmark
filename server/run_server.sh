###############################################################################################
# 1.Introduction
# ==============
#
# This script will start a docker container for dyncam_ros_benchmark_server image. 
# Use it on the machine that has kinect plugged in and is connected to a network to which kinect's data will be streamed.
#
# 2.Pre-requisites
# ================
#
# Install Docker on this machine
#
# 3.Usage
# =======
#
# run_server.sh [OPTIONS]
#
# 4.Description of OPTIONS
# =========================
#
# (a) --ip : IP address of the machine where ros master is running. i.e IP address of the server machine to which kinect is connected. 
#
# 5. Example
# ===========
#
# run_server.sh --ip=192.168.2.100 
#
###############################################################################################

for i in "$@"
do
case $i in
    -i=*|--ip=*)
    IP="${i#*=}"
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

HOST="localhost"
MASTER="localhost"

echo "The following parameters will be used to configure ROS network to connect to Dyncam Benchmark Server :"
echo "ROS_HOST       = ${HOST}"
echo "ROS_MASTER_URL = ${MASTER}"
echo "ROS_IP         = ${IP}"

sudo docker run -it \
  --name=server \
  --rm  \
  --mount type=bind,source=$(pwd)/dyncam_ros,target=/dyncam_ros \
  --net host \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -e ROS_MASTER_URI="http://${MASTER}:11311" \
  -e ROS_HOSTNAME="${HOST}" \
  -e ROS_IP="${IP}" \
  -v /dev/bus/usb:/dev/bus/usb \
  maany/dyncam_ros_benchmark_server_nv \
  /bin/bash 


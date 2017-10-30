#Get ROS 
FROM ros:lunar

#####################
# Configure ROS
#####################
RUN echo "Configuring ROS.."
#source 
RUN /bin/bash -c "source /opt/ros/lunar/setup.bash"
RUN mkdir -p ~/catkin_ws/src
WORKDIR "~/catkin_ws/src"
#RUN /bin/bash -c "catkin_make"
#RUN /bin/bash -c "source ~/catkin_ws/source/devel/setup.bash"
#RUN echo $ROS_PACKAGE_PATH
#####################
# install iai_kinect2
#####################

#install git
RUN apt-get install -y \
	git

# clone repository
RUN git clone https://github.com/code-iai/iai_kinect2



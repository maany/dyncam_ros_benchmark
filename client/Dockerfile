#Get ROS 
FROM ros:lunar

#####################
# Configure ROS
#####################
RUN echo "Configuring ROS..."

# add environment setup 
RUN bin/bash -c "echo 'source /opt/ros/lunar/setup.bash' >> /root/.bashrc"

# Setup catkin workspace
RUN /bin/bash -c "source /opt/ros/lunar/setup.bash && \
                  mkdir -p /catkin_ws/src && \
                  cd /catkin_ws/src && \
                  catkin_init_workspace && \
                  cd /catkin_ws/ && \
                  catkin_make && \
                  echo 'source /catkin_ws/devel/setup.bash' >> /root/.bashrc"

#######################
# install misc packages
#######################
#install git
RUN apt-get install -y \
	git

######################
# install libfreenect2
######################
RUN apt-get update && apt-get install -yq \
    beignet-dev \
    build-essential \
    cmake \
    libusb-1.0.0-dev \
    libturbojpeg \
    libjpeg-turbo8-dev \
    libglfw3-dev \
    libopenni2-dev \
    opencl-headers \
    openni2-utils \
    pkg-config \
    udev

RUN git clone https://github.com/OpenKinect/libfreenect2.git \
    && cd libfreenect2 \
    && mkdir build && cd build \
    && cmake .. -DBUILD_OPENNI2_DRIVER=ON -DCMAKE_INSTALL_PREFIX=/root/freenect2 \
    && make \
    && make install \
    && cp /libfreenect2/platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/ \
    && ldconfig /root/freenect2 \
    && ln -s /libfreenect2/build/bin/Protonect /usr/local/bin/kinect_test \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

######################
#   install opencv
######################


######################
# install iai_kinect2
######################

# clone repository
RUN git clone https://github.com/code-iai/iai_kinect2

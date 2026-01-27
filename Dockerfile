# ROS2 desktop full base image with additional linux utils
FROM osrf/ros:jazzy-desktop AS ros2-base
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y \
    git \
    x11vnc \
    wget \
    unzip \
    xvfb \
    icewm \
    tree \
    dos2unix \
    vim \
    net-tools \
    iputils-ping \
    iproute2 \
    iptables \
    tcpdump \
    nano \
    tmux

# Crazyswarm2 ros2 image for development
FROM ros2-base AS crazyswarm-rmf
RUN apt-get update
RUN apt install -y \
    libboost-program-options-dev \
    libusb-1.0-0-dev
RUN apt-get install -y \
    ros-${ROS_DISTRO}-tf-transformations \
    ros-${ROS_DISTRO}-motion-capture-tracking \
    python3-pip

WORKDIR /workdir

# setup pythonvenv and install dependencies
RUN python3 -m venv .ros_venv
RUN source .ros_venv/bin/activate
RUN pip3 install rowan nicegui=1.4.2 cflib transforms3d

# add source to bashrc  
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc

# create script to install and setup crazyswarm2, crazyflie-firmware and rmf 


CMD tail -f /dev/null

#!/usr/bin/env bash
set -e

echo "==> Setup: Crazyswarm2 + RMF"

ROOT_DIR=/root
RMF_WS=${ROOT_DIR}/rmf_ws
CSWARM_WS=${ROOT_DIR}/cswarm_ws
VENV_PIP=${ROOT_DIR}/.ros_venv/bin/pip3

# Import repositories
echo "==> Importing repositories with vcs"

mkdir -p ${RMF_WS}/src

vcs import ${ROOT_DIR} < ${ROOT_DIR}/crazyswarm.repos
vcs import ${RMF_WS}/src < ${ROOT_DIR}/rmf.repos

# Building Crazyswarm2
echo "==> Building Crazyswarm2"
cd ${CSWARM_WS}
colcon build \
  --symlink-install \
  --cmake-args -DCMAKE_BUILD_TYPE=Release

# Building RMF
echo "==> Building RMF"
cd /root/rmf_ws
rosdep update
rosdep install -y \
  --from-path src \
  --ignore-src \
  --rosdistro $ROS_DISTRO 

export CXX=clang++
export CC=clang
colcon build --mixin release lld

echo "==> Setup completed successfully ✅"


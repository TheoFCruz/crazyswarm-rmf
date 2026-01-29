#!/usr/bin/env bash
set -e

echo "==> Setup: Crazyswarm2 + RMF"

ROOT_DIR=/root
RMF_WS=${ROOT_DIR}/rmf_ws
VENV_PIP=${ROOT_DIR}/.ros_venv/bin/pip3

# Import repositories
echo "==> Importing repositories with vcs"

mkdir -p ${RMF_WS}/src

vcs import ${ROOT_DIR} < ${ROOT_DIR}/crazyswarm.repos
vcs import ${RMF_WS}/src < ${ROOT_DIR}/rmf.repos

# Building Crazyswarm2
# TODO: implement cs2 build
echo "==> Building Crazyswarm2"

# Building RMF
# TODO: implement rmf build
echo "==> Building RMF"

echo "==> Setup completed successfully ✅"


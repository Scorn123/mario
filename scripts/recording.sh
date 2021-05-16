#!/bin/bash
# set -vx
SENSOR_ID=1 # 0 for CAM0 and 1 for CAM1 ports
FRAMERATE=60 # Framerate can go from 2 to 60 for 1920x1080 mode
Date_Today=$(date +%Y%m%d%H%M%S)
gst-launch-1.0 -e nvarguscamerasrc sensor-id=$SENSOR_ID ! "video/x-raw(memory:NVMM),width=1920,height=1080,framerate=$FRAMERATE/1" ! nvv4l2h264enc ! h264parse ! mp4mux ! filesink location=~/Documents/recordings/nvidia_v3_imx477_cam"$SENSOR_ID"_"$Date_Today".mp4 -e


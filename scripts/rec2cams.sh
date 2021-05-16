#!/bin/bash
FRAMERATE=60
gst-launch-1.0 v4l2src device=/dev/video1 ! videorate  ! "video/x-raw(memory:NVMM),width=1920,height=1080,framerate=$FRAMERATE/1" ! nvv4l2h264enc ! h264parse ! mp4mux ! filesink location=~/Documents/recordings/rpi_v3_imx477_cam1.mp4 v4l2src device=/dev/video0 ! "video/x-raw(memory:NVMM),width=1920,height=1080,framerate=$FRAMERATE/1" ! nvv4l2h264enc ! h264parse ! mp4mux ! filesink location=~/Documents/recordings/rpi_v3_imx477_cam1.mp4  -v

SENSOR_ID=0 # 0 for CAM0 and 1 for CAM1 ports
FRAMERATE=60 # Framerate can go from 2 to 60 for 1920x1080 mode
gst-launch-1.0 nvarguscamerasrc sensor-id=$SENSOR_ID ! "video/x-raw(memory:NVMM),width=1920,height=1080,framerate=$FRAMERATE/1" ! nvvidconv ! nveglglessink

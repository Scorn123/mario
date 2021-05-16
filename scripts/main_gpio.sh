#!/bin/bash

#GPIO=22
#cd /sys/class/gpio
#echo $GPIO > export
#cd /sys/class/gpio/gpio$GPIO

#echo "in" > direction
GPIO_input=$(cat value)
echo $GPIO_input
RecStarted=0
while :
do
GPIO_input=$(cat value)
echo $GPIO_input

if ((GPIO_input))
then
	if ((!RecStarted)); then
		echo "recording started"
		./recording.sh &
		RecStarted=1
		sleep 8s
	fi
elif ((RecStarted))
then	
	RecStarted=0
	ps | grep gst | awk '{print $1}' | xargs kill -2 $1 
	echo "recording stopped"
	sleep 8s
fi
sleep 1s

done

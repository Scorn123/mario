#!/bin/bash

GPIO=22
cd /sys/class/gpio
echo $GPIO > export
cd /sys/class/gpio/gpio$GPIO

echo "in" > direction
GPIO_Output="cat value"
echo $GPIO_OUTPUT

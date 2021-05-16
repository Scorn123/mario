#!/bin/bash

while :
do

echo "1. Start Recording"
echo "2. Stop Recording"
echo "3. Quit"
echo -n "Type 1 or 2 or 3 :"
read -n 1 -t 15 a
printf "\n"

case $a in
1* )     ./recording.sh &
	sleep 8s;; 
 
2* )     ps | grep gst | awk '{print $1}' | xargs kill -2 $1 
	sleep 8s;;
 
3* )  
	exit 0;;

 
* )     echo "Try again.";;
esac

done

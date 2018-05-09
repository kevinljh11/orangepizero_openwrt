#!/bin/sh

while :; do 

 CPU_TEMP=`cut -c1-2 /sys/class/hwmon/hwmon2/temp1_input`
#DDR_TEMP=`cut -c1-2 /sys/class/hwmon/hwmon1/temp1_input`
 CPU_INFO=`top -n 1 | awk -F '[ %]+' '/^CPU:/{printf "%d%%\n",100-$8}'`
 time=`date +%F" "%H:%M:%S` 

 #echo "CPU-%" $CPU_INFO
 #echo "CPU-TEMP" $CPU_TEMP
 #echo "DDR-TEMP" $DDR_TEMP
 echo $time" | "$CPU_TEMP"'C   "$CPU_INFO   
 sleep 1 
done


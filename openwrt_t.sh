#!/bin/sh
 RX0=`cat /sys/class/net/eth0/statistics/rx_bytes`
 TX0=`cat /sys/class/net/eth0/statistics/tx_bytes`
while :; do
 time=`date +%m%d" "%H:%M:%S`
 CPU_TEMP=`cut -c1-2 /sys/class/hwmon/hwmon2/temp1_input`
 RX1=`cat /sys/class/net/eth0/statistics/rx_bytes`
 TX1=`cat /sys/class/net/eth0/statistics/tx_bytes`
 rout_bytes=$((RX1 - RX0))
 tout_bytes=$((TX1 - TX0))
 rout_kbytes=$((rout_bytes / 1024 ))
 tout_kbytes=$((tout_bytes / 1024 ))
 RX0=$RX1
 TX0=$TX1
 CPU_INFO=`top -n 1 | awk -F '[ %]+' '/^CPU:/{printf "%02d+%02d= %2d",$2,$4,$2+$4}'`
 printf "$time | "
 printf "$CPU_TEMP"
 printf "'C | "
 printf 'Rx: %4d' $rout_kbytes
 printf " kb/s | Tx: "
 printf '%4d' $tout_kbytes
 printf " kb/s | "
 echo $CPU_INFO" %"
 sleep 1
done

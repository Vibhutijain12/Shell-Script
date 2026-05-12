#!/bin/bash 

echo "Node Health Report of $(date)"

set -x 

echo "Memory Usage"

free -h | grep Mem | awk '{print "Used: "$3" / Total: "$2}'

echo "Disk Usage" 

df -h | awk 'NR==2 {print $5}' | cut -b 1-2

echo "Service Status" 

SERVICE=sshd

if systemctl is-active --quiet "$SERVICE";  then 
        echo "$SERVICE, is running" 
else
        echo "$SERVICE, is stopped"
fi 

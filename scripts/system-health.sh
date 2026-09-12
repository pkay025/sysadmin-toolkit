#!/bin/bash

echo "System Health Check"
echo "==================="

echo
echo "Hostname:"
hostname

echo
echo "Uptime:"
uptime -p

echo
echo "CPU Load:"
uptime | awk -F'load average:' '{print $2}'

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h /

echo
echo "Failed Services:"
failed_services=$(systemctl --failed --no-legend)

if [ -z "$failed_services" ]; then
    echo "No failed services found."
else
    echo "$failed_services"
fi

echo
echo "Health Check Complete."

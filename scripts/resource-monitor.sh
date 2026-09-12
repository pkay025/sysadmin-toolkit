#!/bin/bash

echo "System Resource Monitor"
echo "======================="

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
echo "Top Processes by CPU:"
ps aux --sort=-%cpu | head -n 5

echo
echo "Top Processes by Memory:"
ps aux --sort=-%mem | head -n 5

echo
echo "Resource Monitoring Complete."

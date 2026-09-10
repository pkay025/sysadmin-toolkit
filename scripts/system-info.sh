#!/bin/bash

echo "System Information"
echo "=================="
echo "Hostname: $(hostname)"
echo "OS: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "CPU: $(lscpu | grep 'Model name' | sed 's/Model name:[[:space:]]*//')"
echo "Memory:"
free -h

echo "Disk Usage:"
df -h /
echo "Uptime: $(uptime -p)"

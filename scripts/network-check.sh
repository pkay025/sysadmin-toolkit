#!/bin/bash

echo "Network Information & Connectivity Check"
echo "========================================="

echo
echo "Hostname:"
hostname

echo
echo "IP Addresses:"
ip -br addr

echo
echo "Default Gateway:"
ip route | grep default

echo
echo "DNS Resolution:"
if getent hosts google.com > /dev/null 2>&1; then
    echo "DNS resolution is working."
else
    echo "DNS resolution failed."
fi

echo
echo "Internet Connectivity:"
if ping -c 2 -W 2 8.8.8.8 > /dev/null 2>&1; then
    echo "Internet connectivity is working."
else
    echo "Internet connectivity failed."
fi

echo
echo "Listening Ports:"
ss -tuln

echo
echo "Network Check Complete."

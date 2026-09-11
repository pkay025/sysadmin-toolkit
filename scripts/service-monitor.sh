#!/bin/bash

echo "Service Monitoring Tool"
echo "======================="

echo
echo "Available Services to Check:"
echo "1. SSH"
echo "2. Cron"
echo "3. Network Manager"
echo "4. Custom Service"
echo "5. Exit"

read -p "Choose an option: " choice

case "$choice" in

    1)
        service="ssh"
        ;;

    2)
        service="cron"
        ;;

    3)
        service="NetworkManager"
        ;;

    4)
        read -p "Enter service name: " service
        ;;

    5)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid option."
        exit 1
        ;;
esac

echo
echo "Checking service: $service"

if systemctl is-active --quiet "$service"; then
    echo "Service '$service' is RUNNING."
else
    echo "Service '$service' is NOT RUNNING."
fi

echo
echo "Service Status:"
systemctl status "$service" --no-pager

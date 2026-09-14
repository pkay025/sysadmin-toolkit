#!/bin/bash

echo "Process Management Tool"
echo "======================="

while true; do
    echo
    echo "1. View Running Processes"
    echo "2. Find a Process"
    echo "3. Top CPU Processes"
    echo "4. Top Memory Processes"
    echo "5. Exit"

    read -p "Choose an option: " choice

    case "$choice" in

        1)
            echo
            echo "Running Processes:"
            ps aux --sort=-%cpu | head -n 10
            ;;

        2)
            echo
            read -p "Enter process name: " process_name

            echo
            echo "Processes matching '$process_name':"
            ps aux | grep -i "$process_name" | grep -v grep
            ;;

        3)
            echo
            echo "Top CPU-Consuming Processes:"
            ps aux --sort=-%cpu | head -n 5
            ;;

        4)
            echo
            echo "Top Memory-Consuming Processes:"
            ps aux --sort=-%mem | head -n 5
            ;;

        5)
            echo
            echo "Exiting Process Management Tool..."
            exit 0
            ;;

        *)
            echo
            echo "Invalid option. Please choose 1-5."
            ;;
    esac
done

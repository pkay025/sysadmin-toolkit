#!/bin/bash

echo "Automated Cleanup Tool"
echo "======================"

read -p "Enter directory to clean: " target_dir
read -p "Delete files older than how many days? " days

if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' does not exist."
    exit 1
fi

if ! [[ "$days" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number of days."
    exit 1
fi

echo
echo "Files older than $days days:"
echo "-----------------------------"

old_files=$(find "$target_dir" -type f -mtime +"$days")

if [ -z "$old_files" ]; then
    echo "No files found."
    exit 0
fi

echo "$old_files"

echo
read -p "Do you want to delete these files? (y/n): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    find "$target_dir" -type f -mtime +"$days" -delete
    echo "Cleanup completed successfully."
else
    echo "Cleanup cancelled."
fi

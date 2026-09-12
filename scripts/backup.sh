#!/bin/bash

echo "Backup Tool"
echo "==========="

read -p "Enter directory to backup: " source_dir

if [ ! -d "$source_dir" ]; then
    echo "Error: Directory '$source_dir' does not exist."
    exit 1
fi

backup_name=$(basename "$source_dir")
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_file="backups/${backup_name}_${timestamp}.tar.gz"

tar -czf "$backup_file" "$source_dir"

if [ $? -eq 0 ]; then
    echo
    echo "Backup completed successfully."
    echo "Backup file: $backup_file"
else
    echo
    echo "Backup failed."
    exit 1
fi

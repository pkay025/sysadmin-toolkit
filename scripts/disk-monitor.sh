#!/bin/bash

echo "Disk Monitoring Tool"
echo "===================="

echo
echo "Disk Usage:"
df -h

echo
echo "Disk Usage Warnings:"

warning_found=false

while read -r filesystem size used available usage mounted; do
    usage_number=${usage%\%}

    if [ "$usage_number" -ge 80 ]; then
        echo "WARNING: $mounted is $usage full"
        warning_found=true
    fi
done < <(df -h | tail -n +2)

if [ "$warning_found" = false ]; then
    echo "All filesystems are below 80% usage."
fi


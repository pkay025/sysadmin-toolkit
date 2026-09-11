#!/bin/bash

echo "Log Analyzer Tool"
echo "================="

echo
echo "Recent System Errors:"
echo "--------------------"

error_count=$(journalctl -p err -n 5 --no-pager | grep -c .)

if [ "$error_count" -gt 0 ]; then
    journalctl -p err -n 5 --no-pager
else
    echo "No recent system errors found."
fi

echo
echo "Recent System Warnings:"
echo "-----------------------"

warning_count=$(journalctl -p warning -n 5 --no-pager | grep -c .)

if [ "$warning_count" -gt 0 ]; then
    journalctl -p warning -n 5 --no-pager
else
    echo "No recent system warnings found."
fi

echo
echo "Log Summary:"
echo "------------"
echo "Errors found: $error_count"
echo "Warnings found: $warning_count"

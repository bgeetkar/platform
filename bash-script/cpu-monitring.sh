#!/bin/bash

threshold=90
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# Print the current CPU usage
echo "Current CPU usage: $cpu_usage%"

if [ "$cpu_usage" -gt "$threshold" ]; then
    echo "High CPU usage detected: $cpu_usage%" | mail -s "CPU Usage Alert" geetkar146@gmail.com
fi


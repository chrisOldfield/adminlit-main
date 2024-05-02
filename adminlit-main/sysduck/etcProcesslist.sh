#!/bin/bash

# List running processes parsed by etc paths
ps aux | grep /etc
ps -eo pid,cmd --sort etimes | awk '/^ *[0-9]+ \/etc\//{print}'

# Sort processes by CPU and memory usage (highest to lowest)
echo -e "\nProcesses sorted by system utilization (highest to lowest):"
ps -eo pid,user,%cpu,%mem,cmd --sort=-%cpu,-%mem | head -n 6 | tail -n +2

# Find the systemd service responsible for the highest memory and CPU usage
echo -e "\nSystemd service responsible for the highest memory and CPU usage:"
systemd-cgtop -n 1 -b | grep -E '^[^-.]*\.service' | head -n 1
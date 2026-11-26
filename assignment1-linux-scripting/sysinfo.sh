#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$SCRIPT_DIR/sysinfo_$(date +%Y-%m-%d).txt"

{
    echo "System Info"
    echo "-----------"
    echo "Hostname: $(hostname)"
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S %Z')"
    echo "User: $(whoami)"
    echo ""
    echo "Disk usage (/):"
    df -h /
    echo ""
    echo "Memory usage:"
    free -h
    echo ""
    echo "Top 5 processes by memory:"
    ps -eo pid,user,%mem,%cpu,comm --sort=-%mem | head -n 6
} | tee -a "$LOG_FILE"

echo ""
echo "Saved to $LOG_FILE"

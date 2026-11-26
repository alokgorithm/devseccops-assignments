#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: file '$LOG_FILE' not found" >&2
    exit 1
fi

total_requests=$(awk 'NF { count++ } END { print count + 0 }' "$LOG_FILE")
errors_404=$(awk '$9 == "404" { count++ } END { print count + 0 }' "$LOG_FILE")

echo "Log report: $LOG_FILE"
echo "Total requests: $total_requests"
echo "404 errors: $errors_404"
echo ""
echo "Top 3 IP addresses:"
awk 'NF { print $1 }' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 3 | awk '{ printf "  %-15s (%s requests)\n", $2, $1 }'

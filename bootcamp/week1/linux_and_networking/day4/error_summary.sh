#!/bin/bash

# Log file to process
LOG_FILE="sample.log"

# Check whether the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found"
    exit 1
fi

echo "Error Summary by Hour"
echo "---------------------"

# Find ERROR entries, extract the hour, sort them,
# and count how many errors occurred in each hour.
awk '$3 == "ERROR" {print substr($2,1,2)}' "$LOG_FILE" | sort | uniq -c

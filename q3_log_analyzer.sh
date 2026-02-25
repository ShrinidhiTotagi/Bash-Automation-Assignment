#!/bin/bash
# Q3 - Log File Analyzer

if [ $# -ne 1 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

if [ ! -s "$LOGFILE" ]; then
    echo "Error: Log file is empty."
    exit 1
fi

echo "=== LOG FILE ANALYSIS ==="
echo "Log File: $LOGFILE"

# Total Entries
TOTAL=$(wc -l < "$LOGFILE")
echo "Total Entries: $TOTAL"

# Unique IPs
echo "Unique IP Addresses:"
UNIQUE_IPS=$(awk '{print $1}' "$LOGFILE" | sort -u)
UNIQUE_COUNT=$(echo "$UNIQUE_IPS" | wc -l)
echo "$UNIQUE_IPS" | sed 's/^/ - /'

echo "Total Unique IPs: $UNIQUE_COUNT"

# Status Code Summary (Last field is status code)
echo "Status Code Summary:"
awk '{print $NF}' "$LOGFILE" | sort | uniq -c | \
awk '{printf " %s: %d requests\n", $2, $1}'

# Top 3 IPs
echo "Top 3 IP Addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -3 | \
awk '{printf " %d. %s - %d requests\n", NR, $2, $1}'
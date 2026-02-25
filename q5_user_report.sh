#!/bin/bash
# Q5 - User Account Reporter

echo "=== USER STATISTICS ==="

TOTAL=$(wc -l < /etc/passwd)
SYSTEM_USERS=$(awk -F: '$3 < 1000 {count++} END {print count}' /etc/passwd)
REGULAR_USERS=$(awk -F: '$3 >= 1000 {count++} END {print count}' /etc/passwd)
LOGGED_IN=$(who | awk '{print $1}' | sort -u | wc -l)

echo "Total Users: $TOTAL"
echo "System Users (UID < 1000): $SYSTEM_USERS"
echo "Regular Users (UID >= 1000): $REGULAR_USERS"
echo "Currently Logged In: $LOGGED_IN"

echo ""
echo "=== REGULAR USER DETAILS ==="
printf "%-15s %-5s %-20s %-15s\n" "Username" "UID" "Home Directory" "Shell"
awk -F: '$3 >= 1000 && $3 < 65534 {printf "%-15s %-5s %-20s %-15s\n", $1, $3, $6, $7}' /etc/passwd

echo ""
echo "=== SECURITY ALERTS ==="

ROOT_USERS=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
echo "Users with root privileges:"
echo "$ROOT_USERS"

NO_PASS=$(awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null)

if [ -z "$NO_PASS" ]; then
    echo "All users have passwords set"
else
    echo "Users without passwords:"
    echo "$NO_PASS"
fi
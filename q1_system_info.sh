#!/bin/bash
# Q1 - System Information Display

USERNAME=$(whoami)
HOSTNAME=$(hostname)
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")
OS=$(uname -s)
CURRENT_DIR=$(pwd)
HOME_DIR=$HOME
USERS_ONLINE=$(who | wc -l)
UPTIME=$(uptime -p)

echo "╔════════════════════════════════════════╗"
echo "║        SYSTEM INFORMATION DISPLAY      ║"
echo "╠════════════════════════════════════════╣"
printf "║ Username        : %-20s ║\n" "$USERNAME"
printf "║ Hostname        : %-20s ║\n" "$HOSTNAME"
printf "║ Date & Time     : %-20s ║\n" "$DATETIME"
printf "║ OS              : %-20s ║\n" "$OS"
printf "║ Current Dir     : %-20s ║\n" "$CURRENT_DIR"
printf "║ Home Dir        : %-20s ║\n" "$HOME_DIR"
printf "║ Users Online    : %-20s ║\n" "$USERS_ONLINE"
printf "║ Uptime          : %-20s ║\n" "$UPTIME"
echo "╚════════════════════════════════════════╝"
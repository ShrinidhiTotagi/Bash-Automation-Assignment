#!/bin/bash
# Q2 - File & Directory Manager

while true
do
echo "========== FILE & DIRECTORY MANAGER =========="
echo "1. List files"
echo "2. Create directory"
echo "3. Create file"
echo "4. Delete file"
echo "5. Rename file"
echo "6. Search file"
echo "7. Count files and directories"
echo "8. Exit"
read -p "Enter choice: " choice

case $choice in
1)
    ls -lh
    ;;
2)
    read -p "Enter directory name: " dirname
    mkdir -p "$dirname"
    echo "Directory created."
    ;;
3)
    read -p "Enter file name: " filename
    touch "$filename"
    echo "File created."
    ;;
4)
    read -p "Enter file name to delete: " filename
    if [ -f "$filename" ]; then
        read -p "Are you sure? (y/n): " confirm
        if [ "$confirm" == "y" ]; then
            rm "$filename"
            echo "File deleted."
        fi
    else
        echo "File does not exist."
    fi
    ;;
5)
    read -p "Old file name: " oldname
    read -p "New file name: " newname
    if [ -f "$oldname" ]; then
        mv "$oldname" "$newname"
        echo "Renamed successfully."
    else
        echo "File not found."
    fi
    ;;
6)
    read -p "Enter filename pattern: " pattern
    find . -name "$pattern"
    ;;
7)
    FILES=$(find . -type f | wc -l)
    DIRS=$(find . -type d | wc -l)
    echo "Files: $FILES"
    echo "Directories: $DIRS"
    ;;
8)
    echo "Exiting..."
    break
    ;;
*)
    echo "Invalid choice"
    ;;
esac
done
#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 source_directory backup_directory"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Variables for source and backup directories
SOURCE_DIR=$1
BACKUP_DIR=$2

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Check if the backup directory exists, if not create it
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory $BACKUP_DIR does not exist. Creating it..."
    mkdir -p "$BACKUP_DIR"
fi

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Create the backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create the backup
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup of $SOURCE_DIR completed successfully. Backup file is $BACKUP_FILE."
else
    echo "Backup of $SOURCE_DIR failed."
    exit 1
fi


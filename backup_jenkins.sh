#!/bin/bash

# Create a backup directory with today's date
path="/opt/backup"

backup_dir="$path/$(date +%Y-%m-%d)"
mkdir -p $backup_dir

# Copy the files from /var/www to the backup directory
cp -r /var/www/* $backup_dir

# Delete any backups older than 10 days
find /opt/backup -type d -mtime +10 -exec rm -rf {} \;

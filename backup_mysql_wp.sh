#!/bin/bash

# Create the backup directory if it doesn't exist
sudo mkdir -p /opt/backup

# Define variables for the backup file names
mysql_backup_file="mysql_backup_$(date +%Y-%m-%d).sql"
wordpress_backup_file="wordpress_backup_$(date +%Y-%m-%d).tar.gz"

# Define the MySQL database credentials
mysql_user="wordpressuser"
mysql_password="password"
mysql_database="wordpress"

# Backup the MySQL database
mysqldump -u $mysql_user -p $mysql_password $mysql_database > /opt/backup/$mysql_backup_file

# Backup the WordPress site files
sudo tar -zcvf /opt/backup/$wordpress_backup_file /srv/www/wordpress/

# Delete old MySQL backups, keeping only the last 7
sudo find /opt/backup/ -name "mysql_backup_*" -type f -mtime +7 -delete

# Delete old WordPress backups, keeping only the last 10
sudo find /opt/backup/ -name "wordpress_backup_*" -type f -mtime +10 -delete
#!/bin/bash

# Check if a directory path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Get the directory path from the command-line argument
backup_dir="$1"

# Ensure the provided path is a valid directory
if [ ! -d "$backup_dir" ]; then
    echo "Error: '$backup_dir' is not a valid directory."
    exit 1
fi

# Create a timestamp for the backup folder (format: YYYY-MM-DD-HHMMSS)
timestamp=$(date +%Y-%m-%d-%H%M%S)
backup_folder="$backup_dir/backup_$timestamp"

# Create the backup folder
mkdir -p "$backup_folder"

# Copy all files from the specified directory to the backup folder
cp -r "$backup_dir"/* "$backup_folder"

# Get a list of all backup folders in the specified directory
backup_folders=("$backup_dir"/backup_*)

# Sort the backup folders by name (which contains the timestamp)
sorted_folders=($(printf "%s\n" "${backup_folders[@]}" | sort))

# Calculate the number of backups to keep (at most 3)
backups_to_keep=3
backups_to_remove=$(( ${#sorted_folders[@]} - backups_to_keep ))

# Remove the oldest backup folders if there are more than 3 backups
if [ "$backups_to_remove" -gt 0 ]; then
    for (( i=0; i<$backups_to_remove; i++ )); do
        rm -r "${sorted_folders[i]}"
        echo "Removed old backup: ${sorted_folders[i]}"
    done
fi

echo "Backup completed successfully."

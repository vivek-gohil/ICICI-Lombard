#Write a Shell Script to find out from current directory all the identical files and remove them after doing a confirmation from the user

#!/bin/bash

# Get a list of all files in the current directory
files=$(find . -type f)

# Create an associative array to store file hashes
declare -A file_hashes

# Function to calculate the hash of a file
calculate_hash() {
  md5sum "$1" | awk '{print $1}'
}

# Iterate over the files and calculate their hashes
for file in $files; do
  # Calculate the hash of the file
  file_hash=$(calculate_hash "$file")

  # Check if the hash already exists in the associative array
  if [ -n "${file_hashes[$file_hash]}" ]; then
    # Display the duplicate file
    echo "Duplicate file found: $file"

    # Ask for user confirmation before removing the file
    read -p "Do you want to remove this file? (y/n): " confirm
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
      # Remove the file
      rm "$file"
      echo "File removed: $file"
    else
      echo "File not removed: $file"
    fi
  else
    # Store the hash in the associative array
    file_hashes[$file_hash]=$file
  fi
done

#Write a Shell Script to find out all the Hard links of a particular file and display filename along with directory path using command line argument
#Hardlink  <filename>


#!/bin/bash

# Check if filename is provided as a command line argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a filename as a command line argument."
  exit 1
fi

# Get the filename from the command line argument
filename=$1

# Check if the file exists
if [ -e "$filename" ]; then
  # Find all hard links of the file
  hardlinks=$(find -samefile "$filename")

  # Display the filename along with the directory path for each hard link
  while IFS= read -r link; do
    echo "Hard link: $link"
  done <<< "$hardlinks"

  # If no hard links are found, display a message
  if [ -z "$hardlinks" ]; then
    echo "No hard links found for file: $filename"
  fi
else
  echo "File not found: $filename"
fi

#Write a shell Script which accepts a String and a filename from the user , Check for the file existence , if exists search the string in that file and #display all those lines which contains that string

#!/bin/bash

# Accept the string and filename from the user
read -p "Enter a string: " search_string
read -p "Enter a filename: " filename

# Check if the file exists
if [ -e "$filename" ]; then
  # Search for the string in the file and display lines that contain the string
  grep "$search_string" "$filename"
else
  echo "File not found: $filename"
fi

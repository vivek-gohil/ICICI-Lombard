#Write a Shell Program to accept a Filename in the Command Line of Shell  Program name
#Eg. Info a.c

#Check for the file existence
#If present in current directory , Print the information as given below

#Filename				:
#Inode No				:
#Size in Blocks			:
#Owner/User	Name			:
#Group Name			:
#Date/Time Creation		:
#Date/Time Modification		:
#Date/Time Last Accessed		:
#Total Lines				:
#Total Words				:
#Total Characters			:
#Total Number of Links		:
#File Device Type			:
#File Contents Type			:

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
  # Get information about the file
  inode=$(stat -c "%i" "$filename")
  size=$(stat -c "%s" "$filename")
  owner=$(stat -c "%U" "$filename")
  group=$(stat -c "%G" "$filename")
  creation_time=$(stat -c "%w" "$filename")
  modification_time=$(stat -c "%y" "$filename")
  last_access_time=$(stat -c "%x" "$filename")
  total_lines=$(wc -l < "$filename")
  total_words=$(wc -w < "$filename")
  total_characters=$(wc -m < "$filename")
  total_links=$(stat -c "%h" "$filename")
  file_type=$(file -b --mime-type "$filename")

  # Print the information
  echo "Filename: $filename"
  echo "Inode No: $inode"
  echo "Size in Blocks: $((size / 1024)) KB"
  echo "Owner/User Name: $owner"
  echo "Group Name: $group"
  echo "Date/Time Creation: $creation_time"
  echo "Date/Time Modification: $modification_time"
  echo "Date/Time Last Accessed: $last_access_time"
  echo "Total Lines: $total_lines"
  echo "Total Words: $total_words"
  echo "Total Characters: $total_characters"
  echo "Total Number of Links: $total_links"
  echo "File Device Type: $(stat -c "%F" "$filename")"
  echo "File Contents Type: $file_type"
else
  echo "File not found: $filename"
fi



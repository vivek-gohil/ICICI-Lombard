#Write a Shell program to display Files in the current directory in the format given below using Command Line Parameters 
#Eg. Flist *.sh
#(a.sh) (main.sh) (pract.sh) (b.sh) (menu.sh)

#!/bin/bash

# Check if file pattern is provided as a command line argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a file pattern as a command line argument."
  exit 1
fi

# Get the file pattern from the command line argument
file_pattern=$1

# Find and display the files in the current directory matching the file pattern
for file in $file_pattern; do
  echo "($file)"
done

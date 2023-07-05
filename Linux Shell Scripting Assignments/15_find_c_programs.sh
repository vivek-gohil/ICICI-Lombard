#Write a Shell Script to find out how many C programs file are there in file system and display them along with directory path 
#( Files without .c extention should also be considered as c programs file , if the contents is c program code )


#!/bin/bash

# Function to check if a file is a C program file
is_c_program() {
  file_content=$(cat "$1")
  if [[ "$file_content" == *"{\n"* || "$file_content" == *"int main("* || "$file_content" == *"include <stdio.h>"* ]]; then
    return 0
  else
    return 1
  fi
}

# Recursive function to search for C program files
search_c_programs() {
  local directory=$1
  for file in "$directory"/*; do
    if [ -f "$file" ]; then
      if [[ "$file" == *.c ]] || is_c_program "$file"; then
        echo "$file"
      fi
    elif [ -d "$file" ]; then
      search_c_programs "$file"
    fi
  done
}

# Start the search from the root directory ("/")
search_c_programs "/"


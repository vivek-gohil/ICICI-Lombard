#Write a shell script that accepts one or more filenames as command line arguments and converts all those filenames into upper case , if those files are #present in the current directory
#!/bin/bash

# Check if filenames are provided as command line arguments
if [ $# -eq 0 ]; then
  echo "Error: Please provide one or more filenames as command line arguments."
  exit 1
fi

# Iterate over the filenames provided as command line arguments
for filename in "$@"; do
  # Check if the file exists in the current directory
  if [ -e "$filename" ]; then
    # Convert the filename to uppercase
    new_filename=$(echo "$filename" | tr '[:lower:]' '[:upper:]')

    # Check if the new filename is different from the original filename
    if [ "$new_filename" != "$filename" ]; then
      # Rename the file to the new uppercase filename
      mv -i "$filename" "$new_filename"
      echo "File renamed: $filename -> $new_filename"
    else
      echo "File already in uppercase: $filename"
    fi
  else
    echo "File not found: $filename"
  fi
done
 
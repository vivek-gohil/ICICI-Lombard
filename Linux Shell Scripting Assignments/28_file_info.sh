#Write a Shell program to display Files in the current directory in the format given below using Command Line Parameters 

#Eg. FileInfo *.bash

#( a.bash -> 25 Lines , 130 Words , 890 Characters ) 
#( main.bash -> 33 Lines , 330 Words , 1090 Characters ) 
#( pract.bash -> 12 Lines , 98 Words , 230 Characters ) 

#!/bin/bash

# Iterate over the command line parameters
for file in "$@"; do
  # Check if the file exists
  if [ -f "$file" ]; then
    # Extract the file information
    lines=$(wc -l < "$file")
    words=$(wc -w < "$file")
    characters=$(wc -m < "$file")
    
    # Print the file information in the desired format
    echo "($file -> $lines Lines, $words Words, $characters Characters)"
  else
    echo "$file: File not found."
  fi
done

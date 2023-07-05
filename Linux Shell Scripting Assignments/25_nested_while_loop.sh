#Write a Shell program to display the output using Nested while loops as 
#		
#		1
#		12
#		123
#		1234
#		12345
#		1234
#		123
#		12
#		1

#!/bin/bash

# Define the maximum number of lines
max_lines=5

# Initialize the line number and increment variables
line_num=1
increment=1

# Loop through the lines in the pattern
while (( line_num > 0 )); do
  # Print the current line
  echo -n "	"

  # Print the numbers in the current line
  count=1
  while (( count <= line_num )); do
    echo -n "$count"
    count=$(( count + 1 ))
  done

  # Move to the next line
  echo

  # Check if the maximum number of lines has been reached
  if (( line_num == max_lines )); then
    # Switch the increment to negative for decreasing lines
    increment=-1
  fi

  # Update the line number for the next iteration
  line_num=$(( line_num + increment ))
done

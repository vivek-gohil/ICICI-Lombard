#6)	Write a Shell program to accept Subject Marks and Validate for 
#Blanks , 
#Negative Nos  and 
#Not Greater than 100.
#Give a different Error Message for different values.

#!/bin/bash

# Prompt user for subject marks
echo "Enter subject marks:"
read marks

# Check for blank input
if [ -z "$marks" ]; then
  echo "Error: Marks cannot be blank."
  exit
fi

# Check for negative marks
if [ $marks -lt 0 ]; then
  echo "Error: Marks cannot be negative."
  exit
fi

# Check for marks greater than 100
if [ $marks -gt 100 ]; then
  echo "Error: Marks cannot be greater than 100."
  exit
fi

# Display success message
echo "Marks validation successful."

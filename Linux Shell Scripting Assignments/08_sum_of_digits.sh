#8)	Write a shell Script to input a number through the Keyboard and calculate the sum of all its digit
#Eg :
#Number inputed is 5647
#Result is 5+6+4+7 = 22


#!/bin/bash

# Prompt user for a number
echo "Enter a number:"
read number

# Initialize sum variable
sum=0

# Iterate over each digit in the number
while [ $number -gt 0 ]; do
  # Extract the last digit
  digit=$((number % 10))

  # Add the digit to the sum
  sum=$((sum + digit))

  # Remove the last digit from the number
  number=$((number / 10))
done

# Display the result
echo "Sum of digits: $sum"

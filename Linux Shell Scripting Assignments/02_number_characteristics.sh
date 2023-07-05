#2)Write a Shell program to accept a number & print Positive , Negative , Zero , Greater Then 1000 , Even , Odd numbers as Output.
#!/bin/bash

# Prompt user for a number
echo "Enter a number:"
read number

# Check if the number is positive, negative, or zero
if [ $number -gt 0 ]; then
  echo "Positive"
elif [ $number -lt 0 ]; then
  echo "Negative"
else
  echo "Zero"
fi

# Check if the number is greater than 1000
if [ $number -gt 1000 ]; then
  echo "Greater than 1000"
fi

# Check if the number is even or odd
if [ $((number % 2)) -eq 0 ]; then
  echo "Even"
else
  echo "Odd"
fi

#4)	Write a Shell Script to print the Series
#0 1 1 2 3 5 8 13 21 34 55 89

#!/bin/bash

# Function to print the Fibonacci series
print_fibonacci_series() {
  n=$1

  # First two numbers of the series
  num1=0
  num2=1

  echo -n "$num1 $num2 "

  # Generate the Fibonacci series
  for (( i=2; i<n; i++ )); do
    # Calculate the next number
    next=$((num1 + num2))

    echo -n "$next "

    # Update the variables for the next iteration
    num1=$num2
    num2=$next
  done

  echo ""
}

# Prompt user for the number of terms in the series
echo "Enter the number of terms in the series:"
read terms

# Call the function to print the Fibonacci series
print_fibonacci_series $terms

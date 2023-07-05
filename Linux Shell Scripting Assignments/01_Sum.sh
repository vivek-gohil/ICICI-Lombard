#1)	Write a Shell Script to input Two numbers in a interactive mode and display the sum of two number
#!/bin/bash

# Prompt user for the first number
echo "Enter the first number:"
read num1

# Prompt user for the second number
echo "Enter the second number:"
read num2

# Calculate the sum
sum=$((num1 + num2))

# Display the result
echo "The sum of $num1 and $num2 is: $sum"

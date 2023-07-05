#9)	Write a Shell Script to accept number and print the number in word as 
#Eg : 
#Number inputed is 245
#Result is Two Four Five

#!/bin/bash

# Function to convert a digit to word
digit_to_word() {
  case $1 in
    0) echo "Zero";;
    1) echo "One";;
    2) echo "Two";;
    3) echo "Three";;
    4) echo "Four";;
    5) echo "Five";;
    6) echo "Six";;
    7) echo "Seven";;
    8) echo "Eight";;
    9) echo "Nine";;
  esac
}

# Prompt user for a number
echo "Enter a number:"
read number

# Convert the number to words
result=""
while [ $number -gt 0 ]; do
  # Extract the last digit
  digit=$((number % 10))

  # Convert the digit to word
  word=$(digit_to_word $digit)

  # Prepend the word to the result
  result="$word $result"

  # Remove the last digit from the number
  number=$((number / 10))
done

# Display the result
echo "Result is $result"

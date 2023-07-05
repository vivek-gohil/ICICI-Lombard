#A "lucky number" of a person is one whose individual digits add up to particular number, in successive additions. For example,

#If person date of birth is 19 – 06 – 1975 
#then ( 1+9+0+6+1+9+7+5) = 38
#Further again add the resultant number ( 3 + 8 ) = 11 
#Further again add the resultant number (1 +1 ) = 2
#Till U get 1 digit number

#Lucky number of a person is 2 in the above case

#Write a Shell Script to accept date of birth of a person  
#And find out the lucky number of that person with the above method


#!/bin/bash

# Function to calculate the sum of digits of a number
calculate_sum_of_digits() {
  local number=$1
  local sum=0

  while (( number > 0 )); do
    sum=$(( sum + number % 10 ))
    number=$(( number / 10 ))
  done

  echo "$sum"
}

# Accept the date of birth from the user
read -p "Enter the date of birth (DD-MM-YYYY): " dob

# Remove the hyphens from the date of birth
dob="${dob//-}"

# Calculate the lucky number
while (( ${#dob} > 1 )); do
  dob=$(calculate_sum_of_digits "$dob")
done

echo "Lucky number: $dob"

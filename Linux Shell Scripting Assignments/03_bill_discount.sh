#3)	Write a Shell Programming Using if else then statement
#Accept Customer Name , Bill Amount
#Calculate discount 
#Bill Amount				Discount Rate
#<= 500					Nil 
#> 500 <= 2000				2%
#> 2000 <= 5000				5%
#> 5000 <= 10000				8%
#> 10000 & above				10%

#Print Customer Name , Bill Amount and Discount.
#Also take the output in a file

#!/bin/bash

# Prompt user for customer name
echo "Enter customer name:"
read customer_name

# Prompt user for bill amount
echo "Enter bill amount:"
read bill_amount

# Calculate discount based on bill amount
if [ $bill_amount -le 500 ]; then
  discount_rate=0
elif [ $bill_amount -gt 500 ] && [ $bill_amount -le 2000 ]; then
  discount_rate=2
elif [ $bill_amount -gt 2000 ] && [ $bill_amount -le 5000 ]; then
  discount_rate=5
elif [ $bill_amount -gt 5000 ] && [ $bill_amount -le 10000 ]; then
  discount_rate=8
else
  discount_rate=10
fi

# Calculate discount
discount=$(( (bill_amount * discount_rate) / 100 ))

# Print customer name, bill amount, and discount
echo "Customer Name: $customer_name"
echo "Bill Amount: $bill_amount"
echo "Discount Rate: $discount_rate%"
echo "Discount: $discount"

# Save the output to a file
output_file="customer_bill_discount.txt"
echo "Customer Name: $customer_name" > $output_file
echo "Bill Amount: $bill_amount" >> $output_file
echo "Discount Rate: $discount_rate%" >> $output_file
echo "Discount: $discount" >> $output_file

echo "Output saved to $output_file"

#! /usr/bin/bash

num1=20.5
num2=5

echo "$num1+$num2" | bc
echo "$num1-$num2" | bc
echo "20.5*5" | bc
echo "scale=2;20.5/5" | bc
echo "20.5%5" | bc
echo

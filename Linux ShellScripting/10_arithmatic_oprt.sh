#! /usr/bin/bash

echo 1+1
echo

num1=20
num2=5
echo $num1+$num2
echo

echo $(( $num1+$num2 ))
echo $(( $num1-$num2 ))
echo $(( $num1*$num2 ))
echo $(( $num1/$num2 ))
echo $(( $num1%$num2 ))
echo

echo $(expr $num1 + $num2 )
echo $(expr $num1 - $num2 )
echo $(expr $num1 \* $num2 )
echo $(expr $num1 / $num2 )
echo $(expr $num1 % $num2 )
echo

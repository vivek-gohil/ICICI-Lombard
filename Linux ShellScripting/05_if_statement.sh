#! /usr/bin/bash

#Syntax
#	if [ condition ]
#	then 
#		statement
#	fi

#Integer Comparison
#	-eq - is equal to - if [ "$a" -eg "$b" ]
#	-ne - is not equal to - if [ "$a" -ne "$b" J
#	-gt - is greater than - if [ "$a" -gt "$b" J
#	-ge - is greater than or equal to - if [ "$a" -ge "$b" ]
#	-It - is less than - if [ "$a" -lt "$b" ]
#	-le - is less than or equal to - if [ "$a" -Le "$b" ]
#	< - is less than - (("$a" < "$b"))
#	> - is greater than - (("$a" > "$b"))
#	<= - is less than oF equal to - (("$a" «e "$b"))
#	>= - is greater than or equal to - (("$a" > "$b"))

#Example integer comparison
count=10
if [ $count -eq 10 ]
then
	echo "Condition is true"
else
	echo "Condition is false"
fi
echo

#Example string comparison
word=abc
if [ $word == "abc" ]
then
	echo "String is equal , Condition is true"
else
	echo "Condition is false"
fi
echo

#Multiple condition
message="hello"
if [ $message == "hi" ]
then
	echo "hi message"
	elif [ $message == "hello" ]
	then
		echo "hello message"
else
	echo "No message found"
fi


#! /usr/bin/bash

age=25

if [ "$age" -eq 18 ] || [ "$age" -eq 30 ]
then
	echo "Valid age"
else
	echo "Invalid age"
fi

#! /usr/bin/bash

n=1

while [ $n -le 10 ]
do
	echo "$n"
	#n=$(( n+1 ))
	(( ++n ))
	sleep 1 #seconds
done

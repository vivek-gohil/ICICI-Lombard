#! /usr/bin/bash

for command in ls pwd date
do
	echo "-------------- $command ------------------"
	$command
done
echo
echo

for item in *
do
	if [ -d $item ]
	then
		echo $item
	fi
done






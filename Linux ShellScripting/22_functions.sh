#! /usr/bin/bash

function greet(){
	local message="New Message" #Global Variable
	echo $message
	echo $1
}

quit() {
	exit
}

message="Screeen"
greet $message
echo $message
quit
echo "The End"

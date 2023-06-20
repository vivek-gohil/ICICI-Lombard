#! /usr/bin/bash

#default array args in case we supply 3 args
echo $1 $2 $3

echo Value of first args $1
echo Value of second args $2
echo Value of third args $3
echo Value of Script Name $0
echo

echo Parse the args into an array
#parse the passed args into array
args=("$@")
echo Value of first args ${args[0]}
echo Value of second args ${args[1]}
echo Value of third args ${args[2]}
echo Value of Script Name ${args[3]}
echo

echo Print All The args 
echo $@
echo

echo Print the count/number of args passed to script
echo $#

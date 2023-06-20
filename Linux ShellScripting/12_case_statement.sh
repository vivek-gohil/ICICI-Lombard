#! /usr/bin/bash

vehicle=$1

case $vehicle in
	"car" )
		echo "Rent of $vehicle is 100Rs" ;;
	"van" )
		echo "Rent of $vehicle is 80Rs" ;;
	"bicycle" )
		echo "Rent of $vehicle is 10Rs" ;;
	"truck" )
		echo "Rent of $vehicle is 180Rs" ;;
	* )
		echo "Unknown Vehicle" ;;
esac

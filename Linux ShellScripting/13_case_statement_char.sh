#! /usr/bin/bash

echo -e "Enter some character : \c"
read value

case $value in
	[a-z] )
		echo "User entered $value a to z" ;;
	[A-Z] )
		echo "User entered $value A to Z" ;;
	[0-9] )
		echo "User entered $value 0 to 9" ;;
	? )
		echo "User entered $value spacial character" ;;
	* )
		echo "Unknown Input" ;;
esac

#if case  is not working use LANG=C

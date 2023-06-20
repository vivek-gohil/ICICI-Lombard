#! /usr/bin/bash

echo Check if it is file or not
echo -e "Enter name of file : \c"
read file_name

if [ -f $file_name ] #-e to check the file exists or not and if it is the regular file or not
then
	if [ -w $file_name ]
	then
		echo "Type some text to append into file , To quit press ctrl+d"
		cat >> $file_name
	else
		echo "The file do not have write permissions"
	fi
else
	echo "Not Found!!"
fi
echo

#! /usr/bin/bash

echo Check if the file exists or not
echo -e "Enter name of file : \c"
read file_name

if [ -e $file_name ] #-e to check the file exists or not
then
	echo "$file_name found"
else
	echo "Not Found!!"
fi
echo

echo Check if it is file or not
echo -e "Enter name of file : \c"
read file_name

if [ -f $file_name ] #-f to check the file exists or not and if it is the regular file or not
then
	echo "$file_name found"
else
	echo "Not Found!!"
fi
echo

echo Check if dirctory exists or not
echo -e "Enter name of directory : \c"
read dir_name

if [ -d $dir_name ] #-f to check the file exists or not and if it is the regular file or not
then
	echo "$dir_name found"
else
	echo "Not Found!!"
fi
echo


#To check if file is empty -c
#To check if file has read permission -r
#To check if file has write permission -w
#To check if file has execute permission -x



#! /usr/bin/bash

echo Accepting Single Input Example
echo
#Accept Single input
echo "Enter name : "
read name
echo "Name entered by you : $name"
echo

echo Accept Mulitple Input Example
echo
#Accept Multiple input 
echo "Enter names : "
read user_1  user_2  user_3
echo "User names : $user_1 , $user_2 , $user_3"
echo

echo Accept Input On Same Line Example
echo
#Accept input on same line
read -p 'User Name : ' user_name
echo "User name is : $user_name"
echo

echo Accept Silent Input Example
echo
#Accept input in silent
read -p 'User Name : ' user_name
read -sp 'Password : ' user_password
echo "User name is : $user_name"
echo "User password is : $user_password"
echo

echo Accept Array
echo
#Accept input and store in array
echo "Enter 3 names : "
read -a names
echo "Names entered in array : {names[0]} , {names[1]} , {names[2]}" 
echo

echo Default Input (without declaring variable)
echo
echo "Enter Name"
read
echo "Name entered : $REPLY"


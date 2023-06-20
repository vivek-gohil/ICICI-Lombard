#! /usr/bin/bash

# Program to demonstrate the working of a 
# select-loop in shell scripting

PS3="Enter your choice ==> "
echo "What is your department?"
  
select department in CS IT ECE EE
do
   case $department in

      CS) 
         echo "I am from CS department."
         ;;

        IT)
         echo "I am from IT department."
      ;;

       ECE)
         echo "I am from ECE department."
      ;;

        EE)
         echo "I am from EE department."
      ;;
 
      none) 
         break 
      ;;

      *) echo "Invalid selection" 
      ;;
   esac
done






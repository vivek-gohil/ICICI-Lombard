#7)	Write a Shell Script to Design a Unix/Linux List Command Menu
#As given below

#List Command
#(1)	List directory only in long format
#(2)	List files sorted on size
#(3)	List with Inode Number
#(4)	List in stream format
#(5)	Exit to Shell
#Accept option and execute the command and display the menu again using case and while loop statements

#!/bin/bash

# Function to display the list command menu
display_menu() {
  echo "List Command Menu:"
  echo "(1) List directory only in long format"
  echo "(2) List files sorted on size"
  echo "(3) List with Inode Number"
  echo "(4) List in stream format"
  echo "(5) Exit to Shell"
}

# Function to execute the selected option
execute_option() {
  case $1 in
    1)
      ls -lhd */
      ;;
    2)
      ls -lhS
      ;;
    3)
      ls -li
      ;;
    4)
      ls
      ;;
    5)
      echo "Exiting..."
      exit
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
}

# Display the menu initially
display_menu

# Keep displaying the menu until the user chooses to exit
while true; do
  echo ""
  echo "Enter your option:"
  read option

  # Execute the selected option
  execute_option $option

  echo ""
  # Display the menu again
  display_menu
done





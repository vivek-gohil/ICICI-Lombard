#10)Write a Shell Programming to accept a file name and check whether it is existing and display the permission set as 
#Owner
#	Read
#	Write
#	Execute
#Group
#	Read
#	Write
#	Execute
#Other
#	Read
#	Write
#	Execute


#!/bin/bash

# Prompt user for a file name
echo "Enter the file name:"
read file_name

# Check if the file exists
if [ -e "$file_name" ]; then
  # Get permissions for owner, group, and others
  owner_perms=$(stat -c "%A" "$file_name" | cut -c 2-4)
  group_perms=$(stat -c "%A" "$file_name" | cut -c 5-7)
  others_perms=$(stat -c "%A" "$file_name" | cut -c 8-10)

  # Function to convert permission code to permission string
  convert_to_permission_string() {
    local perms="$1"
    local perm_string=""

    # Check read permission
    if [ "${perms:0:1}" == "r" ]; then
      perm_string+="Read "
    fi

    # Check write permission
    if [ "${perms:1:1}" == "w" ]; then
      perm_string+="Write "
    fi

    # Check execute permission
    if [ "${perms:2:1}" == "x" ]; then
      perm_string+="Execute"
    fi

    echo "$perm_string"
  }

  # Display permissions for owner, group, and others
  echo "Owner: $(convert_to_permission_string $owner_perms)"
  echo "Group: $(convert_to_permission_string $group_perms)"
  echo "Other: $(convert_to_permission_string $others_perms)"
else
  echo "File not found: $file_name"
fi

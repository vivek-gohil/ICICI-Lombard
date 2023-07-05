#5)	Write a Shell Script to display output as using Nested While Loops

#1
#12
#123
#1234
#12345


#!/bin/bash

# Set the initial values
row=1
max_rows=5

# Outer loop for rows
while [ $row -le $max_rows ]; do
  col=1

  # Inner loop for columns
  while [ $col -le $row ]; do
    echo -n "$col"
    col=$((col + 1))
  done

  echo ""
  row=$((row + 1))
done

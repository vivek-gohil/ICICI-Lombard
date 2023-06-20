#! /usr/bin/bash

os=('ubuntu' 'windowns' 'kali')

echo "${os[@]}" #print elements of array
echo "${os[1]}" #print specific value from array
echo "${!os[@]}" #print indexes of array
echo "${#os[@]}" #print length of array

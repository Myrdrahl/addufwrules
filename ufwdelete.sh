#!/bin/bash
input="test.list"
while IFS= read -r line
do
number=$(ufw status numbered | grep $line)
#echo $number
remove=$(echo $number | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//')
#echo $remove
yes | ufw delete $remove
done < "$input"

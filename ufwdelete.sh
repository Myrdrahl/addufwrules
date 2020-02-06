#!/bin/bash
input="test.list"
while IFS= read -r line
do
#Finner regler med IP-ene som er listet i test.list
number=$(ufw status numbered | grep $line)
#echo $number
#Finner nummeret regelen har, i UFW
remove=$(echo $number | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//')
#echo $remove
#Sletter regelen og svarer ja
yes | ufw delete $remove
done < "$input"

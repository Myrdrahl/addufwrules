#!/bin/bash
input="test.list"
while IFS= read -r line
do
ufw allow from $line to any port 22
done < "$input"

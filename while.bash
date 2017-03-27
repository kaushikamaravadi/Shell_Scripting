#!/bin/bash
# Basic while loop
counter=1
while [ $counter -le 10 ]
do
	echo $counter
	counter=$((counter+1))
done
echo All done

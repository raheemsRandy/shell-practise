#!/bin/bash

num1=100
num2=200

sum=$(($num1+$num2))
timestamp=$(date)
echo -e "Script executed at {$timestamp}\nSum is : $sum"
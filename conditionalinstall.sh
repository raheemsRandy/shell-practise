#!/bin/bash


userId=$(id -u)

if [ $userId -ne 0 ]
then 
    echo "please run this command with root access"
    exit 1
else
    echo "Your are running with root access"
fi

dnf install mysql -y
#!/bin/bash


userId=$(id -u)

if [ $userId -ne 0 ]
then 
    echo "please run this command with root access"
    exit 1
else
    echo "Your are running with root access"
fi

dnf install wantederror mysql -y

if [ $? -eq 0 ]
then 
    echo "Installing mysql .....Success"
else
    echo "Installing mysql .....Failure"
    #exit 1
fi
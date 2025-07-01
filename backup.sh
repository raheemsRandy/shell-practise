#!/bin/bash


User_id=$(id -u)
Source_dir=$1
Dest_dir=$2
Days=$(3:-14) #default 14 days

userId=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_folder="/var/log/shellscript-logs"
Script_name=$(echo $0)
Log_file="$Logs_folder/$Script_name.log"
Source_dir=/home/ec2-user/app-logs


Validate(){
    if [ $1 -eq 0 ]
     then 
        echo -e "$2 .....$G Success $N"  | tee -a $Log_file
     else
        echo -e " $2 .....$R Failure $N"| tee -a $Log_file
        exit 1
    fi
}


if [ $userId -ne 0 ]
then 
    echo -e "$R please run this command with root access $N" | tee -a $Log_file
    exit 1
else
    echo -e "$G Your are running with root access $N"  | tee -a $Log_file
fi


check_root
mkdir -p $Logs_folder



#-----------------------------------------
Usage(){
    ech0 -e "$R Usage : $N sh backup.sh <source-dir> <dest-dir> <days>(optional)"
}
if [ $# -lt 1]
then
    Usage
fi


if [ -d $Source_dir ]
then    
    echo "$Source_dir not exists"
    exit 1
fi

if [ -d $Dest_dir ]
then    
    echo "$Dest_dir not exists"
    exit 1
fi







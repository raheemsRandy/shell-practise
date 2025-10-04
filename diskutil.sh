#!/bin/bash
Disk_usage=$(df -hT | grep -v Filesystem)
Disk_threshold=1
Msg=""

while IFS= read line
do
    Usage=$(echo $line | awk '{print 6F}' | cut -d "%" -f1)
    Partition=$(echo $line | awk '{print 6F}')
    echo "$Partition : $Usage"
    if [ $Usage -ge $Disk_threshold ]
    then    
        Msg+="High Disk Usage on $Partition : $Usage \n"
    fi

done <<< $Disk_usage
echo -e $Msg


#get the ip addres of ec2 by curl command
#word to html emplatte

userId=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_folder="/var/log/shellscript-logs"
Script_name=$(echo $0)
Log_file="$Logs_folder/$Script_name.log"
Source_dir=/home/ec2-user/app-logs




-----------------------------------------------------------------

if [ $userId -ne 0 ]
then 
    echo -e "$R please run this command with root access $N" | tee -a $Log_file
    exit 1
else
    echo -e "$G Your are running with root access $N"  | tee -a $Log_file
fi


#-----------------------------------------

Validate(){
    if [ $1 -eq 0 ]
     then 
        echo -e "$2 .....$G Success $N"  | tee -a $Log_file
     else
        echo -e " $2 .....$R Failure $N"| tee -a $Log_file
        exit 1
    fi
}

mkdir -p $Logs_folder

echo "Script started at: $(date)"  | tee -a $Log_file

Files_to_delete=$(find . -name "*.log" -mtime +14)

while IFS=read -r line
do
    echo "Deleting file: $filepath"
    rn -rf $filepath

done <<< $Files_to_delete

echo "script executed successfully : "
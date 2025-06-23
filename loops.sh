


# for i in {1..100}
# do  
#     echo $i
# done

userId=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_folder="/var/log/shellscript-logs"
Script_name=$(echo $0 | cut -d "." -f1) 
Log_file="$Logs_folder/$Script_name.log"
Packages=("mysql" "python3" "nginx")

mkdir -p $Logs_folder
echo "Script started at: $(date)"  | tee -a $Log_file

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
        echo -e "Installing $2 .....$G Success $N"  | tee -a $Log_file
     else
        echo -e "Installing $2 .....$R Failure $N"| tee -a $Log_file
        exit 1
    fi
}

#------------------------------------------------------

for i in ${Packages[@]}
do
    dnf list installed $i&>>$Log_file
    if [ $? -ne 0 ]
    then    
        echo "$i not installed going to install"| tee -a $Log_file

        #dnf install wantederror mysql -y
        dnf install $i -y&>>$Log_file
        Validate $? $i
    else
        echo -e "$Y $i already installed nothing to do$N"| tee -a $Log_file
    fi
done



#--------------------------------------------------
# dnf list installed mysql&>>$Log_file
# if [ $? -ne 0 ]
# then    
#     echo "mysql not installed going to install"| tee -a $Log_file

#     #dnf install wantederror mysql -y
#     dnf install mysql -y&>>$Log_file
#     Validate $? mysql
# else
#     echo -e "$Y mysql already installed nothing to do$N"| tee -a $Log_file
# fi

# #----------------------------------------------

# dnf list installed python3&>>$Log_file
# if [ $? -ne 0 ]
# then    
#     echo "python3 not installed going to install"| tee -a $Log_file

#     #dnf install wantederror mysql -y
#     dnf install python3 -y
#     Validate $? python3

# else
#     echo -e "$Y python3 already installed nothing to do$N"| tee -a $Log_file
# fi

# #-----------------------------------------------------------

# dnf list installed nginx&>>$Log_file
# if [ $? -ne 0 ]
# then    
#     echo "nginx not installed going to install"| tee -a $Log_file

#     #dnf install wantederror mysql -y
#     dnf install nginx -y&>>$Log_file
#     Validate $? nginx

# else
#     echo -e "$Y nginx already installed nothing to do$N"| tee -a $Log_file
# fi
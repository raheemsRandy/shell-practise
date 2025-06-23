



#echo -e "\e[31m Hello word\e[0m\nHelloworld"
userId=$(id -u)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

if [ $userId -ne 0 ]
then 
    echo -e "$R please run this command with root access$N"
    exit 1
else
    echo -e "$R Your are running with root access$N"
fi

#-----------------------------------------

Validate(){
    if [ $1 -eq 0 ]
     then 
        echo -e "Installing $2 .....$G Success $N"
     else
        echo -e "Installing $2 .....$R Failure$N"
        exit 1
    fi
}

#--------------------------------------------------
dnf list installed mysql
if [ $? -ne 0 ]
then    
    echo "mysql not installed going to install"

    #dnf install wantederror mysql -y
    dnf install mysql -y
    Validate $? mysql
else
    echo -e "$Y mysql already installed nothing to do$N"
fi

#----------------------------------------------

dnf list installed python3
if [ $? -ne 0 ]
then    
    echo "python3 not installed going to install"

    #dnf install wantederror mysql -y
    dnf install python3 -y
    Validate $? python3

else
    echo -e "$Y python3 already installed nothing to do$N"
fi

#-----------------------------------------------------------

dnf list installed nginx
if [ $? -ne 0 ]
then    
    echo "nginx not installed going to install"

    #dnf install wantederror mysql -y
    dnf install nginx -y
    Validate $? nginx

else
    echo "$Y nginx already installed nothing to do$N"
fi
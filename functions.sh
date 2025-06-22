#!/bin/bash


userId=$(id -u)

if [ $userId -ne 0 ]
then 
    echo "please run this command with root access"
    exit 1
else
    echo "Your are running with root access"
fi
Validate(){
    if [ $1 -eq 0 ]
     then 
        echo "Installing $2 .....Success"
     else
        echo "Installing $2 .....Failure"
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
    echo "mysql already installed nothing to do"
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
    echo "python3 already installed nothing to do"
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
    echo "nginx already installed nothing to do"
fi


# #dnf install wantederror mysql -y
# dnf install mysql -y

# if [ $? -eq 0 ]
# then 
#     echo "Installing mysql .....Success"
# else
#     echo "Installing mysql .....Failure"
#     exit 1
# fi
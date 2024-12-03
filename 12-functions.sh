#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privilages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is ...FAILED"
        exit 1
        echo "$2 is ...SUCCESS"
    fi
}

CHECK_ROOT

    dnf list installed nginx 

    if [ $? -ne 0 ]
    then
        echo "Nginx is not installed... going to install it"
        dnf install nginx -y
        VALIDATE $? "Installing nginx"
    else
        echo "Nginx is already installed... nothing to do"
    fi

    dnf list installed mysql

    if [ $? -ne 0 ]
    then
        echo "Mysql is not installed... going to install it"
        dnf install mysql -y
        VALIDATE $? "Installing Mysql"
    else
        echo "Mysql is already installed... nothing to do"
    fi

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne o ]
    then
        echo "Please log in with root privilages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is ...$G SUCCES $N"
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to installed it"
    dnf install git -y
    VALIDATE $? "Insstalling Git"
else
    echo "Git is already installed, nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, going to install"
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is already installed, nothing to do"
fi
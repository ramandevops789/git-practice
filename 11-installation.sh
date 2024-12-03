#!/bin/bash

USERID=$(id -u)

if[$USERID -ne 0]
then
    echo "Please run this script with root privilages"
    exit1
fi

dnf list installed git

if[$? -ne 0]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    if[$? -ne 0]
    then
        echo "Git installation is not sucess...Please check it"
        exit1
    else
        echo "Git installation is success"
    fi
else
    echo"Git is already installed, nothing to do..."
fi

dnf list installed mysql

if[$? -ne 0]
then
    echo "Mysql is not installed, going to install"
    dnf install mysql -y
    if[$? -ne 0]
    then
        echo "Mysql installation is not success... Please check"
        exit1
    else
        echo "Mysql installation is success"
    fi
else
    echo "Mysql is already installed, nothing to do.."
fi
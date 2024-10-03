#! /bin/bash

USERID=(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
    echo "Please run this script with root preveleges"
    exit 1
}
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$2 is $R failed $N"
    else
    echo -e "$2 is $G success $N"
}
fi

CHECK_ROOT

# sh 15.loops_install.sh git mysql nginx etc....
for package in $@   #$@ means it will take all the variables
do
  dnf list installed $package
    if [ $? -ne 0 ]
      then 
      echo "$package is not installed.. going to install it"
      git insatll $package -y
      VALIDATE $? "$package installing"
      else
      echo ""$package is already installed.. nothing to do"
    fi
done
#! /bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT()      #If we call the check root then it will get executed
{
    if ( $USERID -ne 0 )
       then 
       echo "Please run the script with root preveleges"
       exit 1
       fi
}

VALIDATE ()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"   # $N means ending that colour & -e is option
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"
fi

CHECK_ROOT

dnf list installed

if ($? -ne 0)
then 
echo "GIT is not installed. Going to install it"
      dnf install git -y
      VALIDATE $? "Installing GIT"

 else "Git is already installed"
 fi
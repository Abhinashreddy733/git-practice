#! /bin/bash

USERID=$(id -u)

CHECK_ROOT()      #If we call the check root then it will get executed
{
    if [ $USERID -ne 0 ]
       then 
       echo "Please run the script with root preveleges"
       exit 1
       fi
}

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
fi
}
CHECK_ROOT        #----> calling check_root condition

dnf list installed git
if [ $? -ne 0 ]
then 
echo "GIT is not installed. Going to install it"
      dnf install git -y
      VALIDATE $? "Installing GIT"

 else "Git is already installed"
 fi
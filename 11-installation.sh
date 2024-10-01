#! /bin/bash

USERID=[ id -u ]
echo "Userid is :$USERID"

----------------
if [ $USERID -ne 0 ]
then 
echo "Please run the script with root preveleges"
exit 1      # other than zero means exit it will stop executing where we get error. Here we know clearly other than zero means failure so we gave 1 then it will come out of script.
fi

dnf list installed

if [ $? -ne 0 ]
then
   echo "Git is not installed. We need to install it"
   dnf install git -y
   if [ $? -ne 0 ]
     then 
      echo "git installation is not successfull. please check it once"
      exit 1 
     else
      echo "git installation is successful"
   fi
else 
  echo "Git is installed"
fi

dnf list installed
if [$? -ne 0]
 then
   echo "Mysql is not installed.. need to install it"
    dnf install mysql -y
   if [ $? -ne 0 ]
     then
       echo "Mysql is not installed means failure. check it once"
       exit 1
     else 
       echo "Mysql is installed.. no need to do anything"
    fi
 else
    echo  "mysql is already intalled"
fi

#! /bin/bash

LOGS_FOLDER="/var/log/shell_script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # --> f1 means Fragment i.e, log & -d means Delimiter
TIMESTAMP=$(date +%Y-m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP"

mkdir -vp /var/log/shell-script/  # As we dont have logs folder we need to create it

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if ($? -ne 0)
    then
    echo -e " $R Plese run the script with the help of root credentials $N" | tee -a $LOGS_FILE
    exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo -e "$R $2 is..Failed $N" | tee -a $LOGS_FILE
    exit 1
    else
    echo -e "$G $2 is..Success $N" | tee -a $LOGS_FILE
    fi
}

# We should show proper info to the user & to show how many arguments are passed
USAGE(){
      echo -e "$R USAGE :$N sudo sh 16.redirectors.sh package1 package2 ..."
      exit 1
}

# to know date & time of execution of script
echo "Script started executing at: $(date)" | tee -a $LOGS_FILE

CHECK_ROOT

if [ $# -eq 0 ]   # $# to know arguments passed
then 
    USAGE
fi

for package in $@   #mysql # $@ it take all the variables which we are giving as i/p on terminanl
do
  dnf list installed $package
  if [ $? -ne 0 ]
     then
      echo "$package is not installed. We are going to install it" | tee -a $LOGS_FILE
      dnf install $package
      VALIDATE $? "Installing $package"
      exit 1
     else
      echo "$package is already installed. Nothing to do" | tee -a $LOGS_FILE
    fi
done
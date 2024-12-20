#! /bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo -e $R "Usage:: $N sh 19-backup.sh <SOURCE> <DESTINATION> <DAYES>"
}

# check weather source & dest are provided or not
if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
 echo "$SOURCE_DIR does not exist...please check"
fi

if [ ! -d $DEST_DIR ]
then
 echo "$DEST_DIR does not exist...please check"
fi

FILES=$(find . -name ${SOURCE_DIR} "*.log" -mtime +${DAYS})
echo "Files: $FILES"

if [ ! -z $FILES ] #true if FILES is empty, ! Makes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi
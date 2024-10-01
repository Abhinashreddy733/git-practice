#! /bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]   # -gt(greater than) -lt(less than) -ne(not equal too)
then 
echo "The given $NUMBER is greater than 20"

else
echo "Then given $NUMBER is less than 20"
fi
#! /bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))   # one brace is for (a+b) and the other one is for script execution time it will consider.

echo "Total of $NUMBER1 & $NUMBER2 is : $SUM"
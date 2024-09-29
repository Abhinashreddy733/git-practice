#! /bin/bash

# If we place the passwd in script it is going to store in git if any one seen it. 
# It leads to security breach to avoid that we are usig read command.

echo "Please enter the USERNAME:"

read USERNAME     # Takes input into username variable

echo "The username entered is :$USERNAME"
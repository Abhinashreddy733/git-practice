#! /bin/bash

# If we place the passwd in script it is going to store in git if any one seen it. 
# It leads to security breach to avoid that we are usig read command.

echo "Please enter the USERNAME:"
read USERNAME     # Takes input into username variable
echo "The username entered is :$USERNAME"

# To hide the username while entering it to provide more security

echo "Please enter the USERNAME:"
read -s USERNAME     # Takes input into username variable
echo "The username entered is :$USERNAME"

echo "Please enter the PASSWORD:"
read -s PASSWORD     # To hide the passowrd we use -s
echo "The PASSWORD entered is :$PASSWORD"
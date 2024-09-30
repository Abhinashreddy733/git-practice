#! /bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "PID(Process Id Instance) of the script executing now: $$"
sleep 100 &  # It will goto sleep mode till 100sec. Till that time it will run in background
echo "PID of last background activity or command: $!"
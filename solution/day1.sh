#!/bin/bash

#Above line is called shebang or hashbang which tells the operating system to use the bash interpreter to execute the script.

#Task 2: Echo

echo " BashBlaze Challenge initiated by @TWS."

#Task 3: Variables
var1="hello"
 read -p "enter your name:" var2

#Task 4: Using variables
greet="$var1,$var2"
echo "$greet ! Welcome to the world of scripting"

#Task 5: Using Built-in Variables
echo "My current bash path - $BASH"
echo "Bash version I am using - $BASH_VERSION"
echo "PID of bash I am running - $$"
echo "My home directory - $HOME"
echo "Where am I currently? - $PWD"
echo "My hostname - $HOSTNAME"

#Task 6: Wildcards
echo " Files with .sh extension in current directory"
ls *.sh



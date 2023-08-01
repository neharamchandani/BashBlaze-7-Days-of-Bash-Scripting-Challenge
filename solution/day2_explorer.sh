#!/bin/bash
echo -e "\tWelcome to the Interactive File and Directory Explorer!"
sleep 1s
echo -e "\n"

#Part 1
# Display Files and Directories in human readable format
read -p "Enter the path where you want to list files and directories: " path
echo "Files and Directories in the $path:"
files=$(ls -lh $path | awk '{print $9,"("$5")"}')
echo -e "\n$files"

if [[ $path == ""  ]]
then
        echo "Exiting... No path Specified!!!"
        echo """
        Specify path like this --> $PWD
        """
        exit 1;
fi

# Part 2
# Ask user to enter a string
while :
do
	echo -e "\n \t"
	read -p "Enter a line of text (Press Enter without text to exit):" inp
	characters=$(echo $inp | wc | awk '{print $3}' )
	if [[ $characters == 1  ]]
        then
                echo "Exiting the Interactive Explorer. Goodbye!"
           
                exit 1;
        else
                
                echo "Character count : $characters"
        fi

done
	

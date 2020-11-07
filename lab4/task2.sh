#!/bin/bash

#a)
dir="$HOME/.trash"
dir_log="$HOME/.trash.log"
if [[ $# -ne 1 ]]
then
	echo "Wrong number of arguments (requires 1 got $#)"
	exit
fi

if [[ ! -d $dir ]]
then
	echo "Dir $dir doesn't exist"
	exit
fi

if [[ ! -e $dir_log ]]
then
	echo "File $dir_log doesn't exist"
	exit
fi

if [[ $(grep -E "/$1 " $dir_log) == "" ]]
then
	echo "Incorrect name of input parameter or file $1 doesn't exist"
	exit
fi

#b)
echo "$(grep -E "/$1" $dir_log)"|
while read line;
do
	file_path=$(echo "$line" | awk '{print $1}')
	file_reference=$(echo "$line" | awk '{print $2}')
	read -p "Do operation with $file_path (y/n)?" answer <&1
#c)
	case $answer in
		"yes" | "Y" | "y")
			way=$(echo "$file_path" | awk -F"/$1" '{print $1}')
			if [[ ! -d $way ]]
			then
				echo "Dir $way doens't exist, file will be restored in $HOME"
				if [[ -f $file_path ]]
				then
					read -p "File $file_path exists, type new name: " new_name <&1
					ln "$file_reference" "$HOME/$new_name"
					rm "$file_reference"
				else
					ln "$file_reference" "$HOME/$1"
					rm "$file_reference"
				fi
			else
				if [[ -f $file_path ]]
				then
					read -p "File $file_path exists, type new name: " new_name <&1
					ln "$file_reference" "$way/$new_name"
					rm "$file_reference"
				else
					ln "$file_reference" "$way/$1"
					rm "$file_reference"
				fi
			fi
			;;
		*)
			continue
			;;
	esac
done

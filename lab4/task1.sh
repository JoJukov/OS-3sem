#!/bin/bash

if [[ ! -e "$PWD/.number_tmp.log" ]]
then
	echo 0 > "$PWD/.number_tmp.log"
fi

#a)
if [[ $# -ne 1 ]]
then
	echo "Wrong number of input arguments (requires 1)"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "$1: That file doesn't exist"
	exit
fi

#b)
dir="$HOME/.trash"
dir_log="$HOME/.trash.log"
if [[ ! -d $dir ]]
then
	mkdir $dir
fi

#c)
number_tmp=$(cat $PWD/.number_tmp.log)
ln "$PWD/$1" "$dir/$number_tmp"
tmp="$PWD/$1"
tmp_ln="$dir/$number_tmp"
touch "$tmp_ln"
let number_tmp=number_tmp+1
echo "$number_tmp" > "$PWD/.number_tmp.log"
rm $tmp

#d)
echo "$tmp $tmp_ln" >> $dir_log


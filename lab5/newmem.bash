#!/bin/bash
declare -a arr
iter=0
n=$1
for ((;;))
do
	let iter=iter+1
	for ((m=0;m<10;m++))
	do
		if [ "${#arr[@]}" -le "$n" ]
		then
		arr+=("$m")
		else
			exit
		fi
	done

done


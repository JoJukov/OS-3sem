#!/bin/bash
>report2.log
declare -a arr
iter=0
for ((;;))
do
	let iter=iter+1
	for ((m=0;m<10;m++))
	do
		arr+=("$m")
	done
	if [[ $((${iter} % 100000)) -eq 0 ]]
	then
		echo "${#arr[@]}" >> report2.log
	fi
done


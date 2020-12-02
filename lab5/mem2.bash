#!/bin/bash
>report2.log
declare -a arr1
iter=0
for ((;;))
do
	let iter=iter+1
	for ((m=0;m<5;m++))
	do
		arr1+=("$m")
	done
	if [[ $((${iter} % 100000)) -eq 0 ]]
	then
		echo "${#arr1[@]}" >> report2.log
	fi
done


#!/bin/bash
>report.log
declare -a arr
iter=0
for ((;;))
do
	let iter=iter+1
	for ((m=0;m<3;m++))
	do
		arr+=("$m")
	done
	if [[ $((${iter} % 100000)) -eq 0 ]]
	then
		echo "${#arr[@]}" >> report.log
	fi
done


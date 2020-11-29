#!/bin/bash
>.inf_for_plot1_mem.log
>.inf_for_plot1_swap.log
>config.log
i=0
for((;;))
do
	let i=i+1
	sleep 1s
	grep_c=$(top -b -n 1 | grep -E " mem[2]*.bash")
	if [ -n "${grep_c}" ]
	then
		echo "___Info in $(date)" >> config.log
		echo "	System mem params" >> config.log
		echo "$(top -b -n 1 | grep -E "MiB Mem")" >> config.log
		echo "$i $(top -b -n 1 | grep -E "MiB Mem" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1)" >> .inf_for_plot1_mem.log
		echo "$(top -b -n 1 | grep -E "MiB Swap")" >> config.log
		echo "$i $(top -b -n 1 | grep -E "MiB Swap" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1)" >> .inf_for_plot1_swap.log
		echo >> config.log
		echo "	Info about mem.bash" >> config.log
		echo "${grep_c}" >> config.log
		echo >> config.log
		echo "	Info about first five processes" >> config.log
		echo "$(top -b -n 1 | head -n 12 | tail -n 5)" >> config.log
		echo >> config.log
	else
		./monitor1.bash
		exit
	fi
done

#!/bin/bash
>.inf_for_plot2_mem.log
>.inf_for_plot2_swap.log
>config2.log
i=0
for((;;))
do
	sleep 1s
	let i=i+1
	grep_c=$(top -b -n 1 | grep -E "mem[2]*.bash")
	if [ -n "$grep_c" ]
	then
		echo "___Info in $(date)" >> config2.log
		echo "	System mem params" >> config2.log
		echo "$(top -b -n 1 | grep -E "MiB Mem")" >> config2.log
		echo "$(top -b -n 1 | grep -E "MiB Mem" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1)" >> .inf_for_plot2_mem.log
		echo "$(top -b -n 1 | grep -E "MiB Swap")" >> config2.log
		echo "$(top -b -n 1 | grep -E "MiB Swap" | grep -Eo "[0-9]+" | awk '{print $1}' | head -n 3 | tail -n 1)" >> .inf_for_plot2_swap.log
		echo >> config2.log
		echo "	Info about mem_together.bash" >> config2.log
		echo "${grep_c}" >> config2.log
		echo >> config2.log
		echo "	Info about first five processes" >> config2.log
		echo "$(top -b -n 1 | head -n 12 | tail -n 5)" >> config2.log
		echo >> config2.log
	else
		./monitor2.bash
		exit
	fi
done

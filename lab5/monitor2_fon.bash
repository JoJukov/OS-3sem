#!/bin/bash
for((;;))
do
	sleep 5s
	grep_c=$(top -b -n 1 | grep -E "mem2.bash")
	if [ -n "$grep_c" ]
	then
		echo "___Info in $(date)" >> config2.log
		echo "	System mem params" >> config2.log
		echo "$(top -b -n 1 | grep -E "MiB Mem")" >> config2.log
		echo "$(top -b -n 1 | grep -E "MiB Swap")" >> config2.log
		echo >> config2.log
		echo "	Info about mem_together.bash" >> config2.log
		echo "${grep_c}" >> config2.log
#	echo "$(top -b -n 1 | grep "mem2.bash")" >> config2.log
		echo >> config2.log
		echo "	Info about first five processes" >> config2.log
		echo "$(top -b -n 1 | head -n 12 | tail -n 5)" >> config2.log
		echo >> config2.log
	else
		exit
	fi
done

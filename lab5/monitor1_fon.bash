#!/bin/bash
for((;;))
do
	sleep 5s
	grep_c=$(top -b -n 1 | grep -E "mem[2]*.bash")
	if [ -n "${grep_c}" ]
	then
		echo "___Info in $(date)" >> config.log
		echo "	System mem params" >> config.log
		echo "$(top -b -n 1 | grep -E "MiB Mem")" >> config.log
		echo "$(top -b -n 1 | grep -E "MiB Swap")" >> config.log
		echo >> config.log
		echo "	Info about mem.bash" >> config.log
		echo "${grep_c}" >> config.log
		echo >> config.log
		echo "	Info about first five processes" >> config.log
		echo "$(top -b -n 1 | head -n 12 | tail -n 5)" >> config.log
		echo >> config.log
	else
		exit
	fi
done

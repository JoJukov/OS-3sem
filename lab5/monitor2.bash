#!/bin/bash
killall monitor2_fon.bash 2>/dev/null
#killall monitor1_fon.bash 2>/dev/null
echo "_____Last info in dmesg about process_____" >> config2.log
dmesg | grep -E "mem[2]*.bash" | tail -4 >> config2.log
echo "_____Last info in report.log_____" >> config2.log
cat report.log | tail -1 >> config2.log
echo "_____Last info in report2.log_____" >> config2.log
cat report2.log | tail -1 >> config2.log



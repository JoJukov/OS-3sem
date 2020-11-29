#!/bin/bash
killall monitor1_fon.bash 2>/dev/null
echo "_____Last info in dmesg about process_____" >> config.log
dmesg | grep -E "mem.bash" | tail -2 >> config.log
echo "_____Last info in report.log_____" >> config.log
cat report.log | tail -1 >> config.log



#!/bin/bash
for ((i=0;i<30;i++))
do
	sleep 1s
	./newmem.bash 1200000 &
done

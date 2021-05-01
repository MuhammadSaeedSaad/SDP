!/usr/bin/env bash

file_name="direct.xml"
priority=0
for ((i=0; i<10; i++))
do
	for ((j=0; j<1000; j++))
	do
		priority=$((($i * 1000) + $j))
			echo "<rule priority=$priority table=\"filter\" ipv=\"ipv4\" chain=\"FORWARD\">-p tcp -s 10.8.$((1 + $RANDOM % 254)).$((1 + $RANDOM % 254))/32 -d 172.31.$((1 + $RANDOM % 254)).$((1 + $RANDOM % 254))/32 --dport $((5 + $RANDOM % 1000)) -i wg0 -o eth0 -j ACCEPT</rule>" >> direct.xml
	done
done

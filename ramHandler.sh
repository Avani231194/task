#!/bin/bash

function meminfo() {
	
	memories=$(cat /proc/meminfo |  grep -i -e 'MemTotal' -e 'MemFree' | awk '{print $2}')
	IFS=" "
	while read mem; do
		memory[$((i++))]=$mem
	done <<< "$(echo -e "$memories")"
	avgCalculator ${memory[0]} ${memory[1]}
}

function avgCalculator() {

	memory=( "$@" )
	
	memTotalMb=$(echo "scale=0; ${memory[0]} / 1024" | bc)
	memAvailMb=$(echo "scale=0; ${memory[1]} / 1024" | bc)
	memAvailPer=$(echo "scale=2; ${memory[1]}*100/${memory[0]}" | bc)
	memUsedPer=`echo "100 $memAvailPer" | awk '{print $1-$2}'`
	echo "Total Memory:		" ${memory[0]} "("${memTotalMb}"mb)"
        echo "Free Memory:		" ${memory[1]} "("${memAvailMb}"mb)"
	echo "Free Memory(%):		" $memAvailPer"%"
	echo "Used Memory(%):		" $memUsedPer"%"
	cleanRam $memAvailPer
}

function cleanRam() {
	
	memAvailPer=$1
	if (( $(echo "$memAvailPer < 30.00" |bc -l) )); then
		echo "Cleaning RAM ... .. ."
		echo -ne '#####                     (33%)\r'
		sleep 1
		echo -ne '#############             (66%)\r'
		`echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null`
		sleep 1
		echo -ne '#######################   (100%)\r'
		echo -ne '\n'
	else
		echo "Good amount of RAM is available/free (`echo $memAvailPer`%). No need to clean RAM."
	fi
}

meminfo

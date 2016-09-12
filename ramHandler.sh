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
	if (( $(echo "$memAvailPer < 40.00" |bc -l) )); then
		echo -e "\033[0;31mCleaning RAM ... .. . \033[0m"
		sleep 0.1
		echo -ne "\033[0;34m=====>                            (20%)\r \033[0m"
		sleep 0.1
		echo -ne "\033[0;34m=============>                    (40%)\r \033[0m"
		sleep 0.1
		echo -ne "\033[0;34m=====================>            (60%)\r \033[0m"
		sleep 0.1
		echo -ne "\033[0;34m==========================>       (80%)\r \033[0m"
		`echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null`
		sleep 0.1
		echo -ne "\033[0;34m==================================(100%)\r \033[0m"
		echo -ne '\n'
	else
		echo -e "\033[1;32mGood amount of RAM is available/free (\033[0;34m`echo $memAvailPer`%\033[0m\033[1;32m). No need to clean RAM.\033[0m"
	fi
}

meminfo

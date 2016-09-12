#This script will purge cache and buffer memory if the RAM conumsption is higher than 90%
# This script should be run via root user only.
# Syntax bash ramCheck.sh

#!/usr/bin/env bash
ramCheck(){
echo -e "\n"
echo -e "------------------------ This Script checks for Current System Memory Usage and purges the caches if it's greater than 90% -----------------------------"
MEMTOTAL=`grep MemTotal /proc/meminfo  | awk '{print $2}' `

MEMFREE=`grep MemFree /proc/meminfo  | awk '{print $2}' `
MEMFREEP=$(echo "scale=2; ${MEMFREE}*100/${MEMTOTAL} " | bc)
MEMUSED=$(expr ${MEMTOTAL} - ${MEMFREE} )
MEMUSEDP=$(echo "scale=2; ${MEMUSED}*100/${MEMTOTAL} " | bc)

echo  -e  " TOTAL MEMORY   \t : \t$(( MEMTOTAL/ 1024 )) MB "
echo  -e  " FREE MEMORY ($MEMFREEP%)    :    \t$(( MEMFREE / 1024 )) MB "
echo  -e  " USED MEMORY ($MEMUSEDP%)    :   \t$(( MEMUSED / 1024 )) MB "

MEMT=$(echo "scale=2; ${MEMTOTAL}*.90" | bc)

if (( $(echo "$MEMUSED > $MEMT" |bc ) )); then
   echo  "Memory has crossed the 90% threshold, Purging the Cache ......"
   sleep 3
   echo 3 | sudo tee  /proc/sys/vm/drop_caches
   echo  -e  " FREE MEMORY ($MEMFREEP%)    :    \t$(( MEMFREE / 1024 )) MB "
   echo  -e  " USED MEMORY ($MEMUSEDP%)    :   \t$(( MEMUSED / 1024 )) MB "
else
   echo "The Memory is under threshold, no purging is required. "
fi
echo -e "\n"
}

checkuser() {
    if [ "$(id -u)" != "0" ]; then
       echo "This script must be run as root" 1>&2
       exit 1
   else
       ramCheck
    fi
}
checkuser


#!/bin/bash
#I will have my script in file from today onwards.

#We are going to use a Variable to get the Total Rame Size
TOTAL_RAM=`free -m | awk '{print $2}'| head -2 | tail -1`
echo Total RAM : $TOTAL_RAM
 
#This will show us the Total Free Ram which is not been used right now
FREE_RAM=`free -m | awk '{print $4}'| head -3| tail -1`
echo Free RAM : $FREE_RAM
 
#Here We will use FREE_PERCENT & USED_PERCENT as variables to get the desired result
FREE_PERCENT=$(( 100*FREE_RAM / TOTAL_RAM ))
USED_PERCENT=$(( 100-$FREE_PERCENT))

#Here i will use IF/THEN condition so that we can verify and run the command if RAM goes below 10%
if [ $FREE_PERCENT -le 10 ]
then
echo 3 > /pro/sys/vm/drop_caches
else

echo "We have got $FREE_PERCENT% RAM available in our system and $USED_PERCENT% of RAM is being used, so we don't need to clear the cache"

fi

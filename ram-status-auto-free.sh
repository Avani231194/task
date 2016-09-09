#!/bin/bash

totalmem=$(free -m | grep Mem | awk {'print $2'})
usedmem=$(free -m | grep Mem | awk {'print $3'})
freemem=$(free -m | grep Mem | awk {'print $4'})

echo "Total Mem : $totalmem MB"
echo "Used Mem : $usedmem MB"
echo "Free Mem : $freemem MB"

usedmemperc=$(bc <<< "scale=2; ($usedmem/$totalmem)*100")
usedmempercabs=${usedmemperc/.*}

if [[ $usedmempercabs -ge 90 ]]
then
        echo "Used memory is $usedmemperc %, clearing up the cache"
        echo 3 > /proc/sys/vm/drop_caches
        usedmemnew=$(free -m | grep Mem | awk {'print $3'})
        usedmemnewperc=$(bc <<< "scale=2; ($usedmemnew/$totalmem)*100")
        echo "Present Used memory is $usedmemnewperc %"
else
        echo "Used memory is $usedmemperc %, no need to clear cache"
fi


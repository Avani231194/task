#!/bin/bash
RAMPERC=`free -m | grep Mem: | awk '{print $4/$2 * 100.00}'`
echo $RAMPERC
if [ $(echo "$RAMPERC <= 10" | bc) -eq 1 ]
then
 echo 1 > /proc/sys/vm/drop_caches
 echo 3 > /proc/sys/vm/drop_caches
# echo "gadbad  hai"
else
 echo "bdya hai"
fi

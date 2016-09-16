#!/bin/bash
echo current_status : 
  memory=$(free -m | grep Mem | awk {'print $2'})
echo $memory mb is the Total Memory
  used_memory=$(free -m | grep Mem | awk {'print $3'})
echo $used_memory mb is the Used Memory
  free_memory=$(free -m | grep Mem | awk {'print $4'})
echo $free_memory mb is the Free Memory
percentage_used=$(( 100*used_memory / $memory ))
echo percentage used is $percentage_used 
if [ $percentage_used -ge 50 ] 
then
 echo 3 > /proc/sys/vm/drop_caches
else
echo You have more then 50% free RAM
fi
echo current_status : 
  memory=$(free -m | grep Mem | awk {'print $2'})
echo $memory mb is the Total Memory
  used_memory=$(free -m | grep Mem | awk {'print $3'})
echo $used_memory mb is the Used Memory
  free_memory=$(free -m | grep Mem | awk {'print $4'})
echo $free_memory mb is the Free Memory


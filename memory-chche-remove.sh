echo "Current Memory Status"
totalmem=$(free -m | grep Mem | awk {'print $2'})
usedmem=$(free -m | grep Mem | awk {'print $3'})
freemem=$(free -m | grep Mem | awk {'print $4'})

echo "Total Mem : $totalmem MB"
echo "Used Mem : $usedmem MB"
echo "Free Mem : $freemem MB"

d=`free | grep Mem | awk '{print $4/$2 * 100.0}'`
echo "Total used Memory  $d %"
var=$(awk 'BEGIN{ print "'$d'"<"'$result'" }')
if [ "$var" -lt 20 ]
then
e=`echo 3 > /proc/sys/vm/drop_caches`
echo $e
f=`free | grep Mem | awk '{print $4/$2 * 100.0}'`
echo "Removed cache now Memory $f %"
else
echo "Memory is Grater then 20%"
fi

echo "After Cache delete Memory Status"

totalmem=$(free -m | grep Mem | awk {'print $2'})
usedmem=$(free -m | grep Mem | awk {'print $3'})
freemem=$(free -m | grep Mem | awk {'print $4'})

echo "Total Mem : $totalmem MB"
echo "Used Mem : $usedmem MB"
echo "Free Mem : $freemem MB"


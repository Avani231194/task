
total_memory=$(free -m | awk '{print $2}' | head -2 | tail -1);

free_memory=$(free -m | awk '{print $4}'| head -3 | tail -1);

let a="$free_memory * 100"

let b="$a / $total_memory"

echo "free ram is $b%";


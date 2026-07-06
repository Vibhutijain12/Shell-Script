#### 1. Write a script to monitor disk usage and send an alert if usage exceeds 80%.

```sh 
#!/bin/bash

thershold=80
subject="Disk critical"

disk_usage=$(df -h | awk 'NR==3 {print $5}' | cut -c 1,2)

if [[ $disk_usage -ge $threshold ]]; then
        echo "Alert!!!, Disk is critical, ${disk_usage}"
else
        echo "Disk is stable"
fi
```
#### 2. Write a script to monitor CPU, memory, and disk usage.

```sh 
# cpu usage

#!/bin/bash

thershold=80

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')

echo "Current CPU Usage: $cpu%"

if [ "$cpu" -gt "$thershold" ]; then
    echo "High CPU Usage!"
else
    echo "CPU Usage is Normal."
fi
```

```sh 
# Disk usage
#!/bin/bash

thershold=80
subject="Disk critical"

disk_usage=$(df -h | awk 'NR==3 {print $5}' | cut -c 1,2)

if [[ $disk_usage -ge $threshold ]]; then
        echo "Alert!!!, Disk is critical, ${disk_usage}"
else
        echo "Disk is stable"
fi
```

```sh
# Memory usage

#!/bin/bash

thershold=80


total_mem=$(free -m  | awk '/Mem:/ {print $2}')
used_mem=$(free -m  | awk '/Mem:/ {print $3}')
available_mem=$(free -m | awk '/Mem:/ {print $7}')

usage=$(( (total_mem - available_mem) * 100 / total_mem ))

if [[ $usage -ge 80 ]]; then
        echo "Alert!!!, Memory usage is critically high!, ${usage}" | mail -s "vibhutijain270@gmail.com"
else
         echo "Memory health is stable."
fi
```



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

#### 3. Rename multiple files with different names

```sh
#!/bin/bash

while read old new
do
        if [[ -f $old ]]; then
                if [[ ! -e $new ]]; then
                        mv ${old} ${new}
                        echo "renaming $old --> $new"
                else
                        echo "Skipping: $new already exists."
                fi
        else
                echo "Skipping: $old does not exist."
        fi
done < rename.txt
```
#### 4. Write a script to monitor a service (e.g., nginx) and restart it if it stops.

```sh
#!/bin/bash

read -p "Enter the service want to check: " service

target_dir="/home/vibhuti/error.log"
timestamp=$(date +%Y-%m-%d_%H:%M:%S)

if ! systemctl is-active --quiet ${service}; then
        echo "$timestamp : ${service} is DOWN, trying to restart" >> "${target_dir}"
        sudo systemctl restart ${service}

        sleep 2s

        if systemctl is-active --quiet ${service}; then
             echo "$timestamp : $service was restarted successfully." >> "$target_dir"
       else
             echo "$timestamp : CRITICAL - $service failed to restart!" >> "$target_dir"
       fi
fi
```

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

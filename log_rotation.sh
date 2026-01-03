#!/bin/bash

log_file="/var/log/app.log"
max_size=10000
backup_dir="/home/ubuntu/access"
timestamp=$(date "+%Y-%m-%d-%H:%M:%S")

# 1. Check if the file exists and get its size in KB

if [[ -f "$log_file" ]]; then
        echo "file exists"
        log_size=$(du -k "$log_file" | cut -c1)
        echo ${log_size}
else
        echo "file does not exist"
        exit 1
fi

if [[ $log_size -lt $max_size ]]; then
        echo "log file size not exceeded"

else
        echo "log file size exceeded"

        if [[ ! -d "$backup_dir" ]]; then
                echo "Directory doesn't exist, creating it"
                mkdir -p "${backup_dir}"
        else
                echo "Directory exists"
        fi

        backup="${backup_dir}/${timestamp}-access_log.tar.gz"
        tar -czf "${backup}" "${log_file}"
        echo " Backup has taken"
        find "$backup_dir" -name "*.gz" -mtime +30 -exec rm {} \;
fi

## 1. write a script to take a backup of a directory and compress it with timestamp.
#!/bin/bash

src="/home/ubuntu/shell"
dest="/home/ubuntu/shell/backup"

timestamp=$(date +%Y-%m-%d-%H-%M-%S)

backup_file="${dest}/backup_cp-"
compress="${backup_file}${timestamp}.tar.gz"


# Create backup
tar -czf "$compress" "$src"

# Check result of tar command
if [ $? -eq 0 ]; then
    echo "Backup successful: $compress"
else
    echo "Backup failed"
fi

## 2. Write a script - If disk usage > 80%, send alert message

#!/bin/bash

read -p "Enter the thershold value: " thershold

email="vibhutijain393@gmail.com"

usage=$(df -h | awk 'NR==2 {print $5}' | cut -b1-2)

if [[ -z ${thershold} ]]; then
        echo "Need input from user"
        exit 1
else

        if [[ $usage -ge $thershold ]]; then
            echo "Warning: Disk usage on / is above ${thershold} ${usage}%!" | mail -s "Disk Space Alert: ${usage}% Used On $(hostname)" ${email}
        else
            echo "Disk is Safe"
fi 

## 3. Check if a process is running and Restart if stopped

#/bin/bash

process_name=$1
START_CMD="systemctl restart nginx"
LOGFILE="/home/ubuntu/process_monitor.sh"

if [[ $# -ne 1 ]]; then
        echo "Need one argument to continue"
        exit 1
else
        if pgrep -x "${process_name}" > /dev/null; then
            echo "$(date +%Y-%m-%d): ${process_name} is running" >> "${LOGFILE}"
        else
            echo "$(date +%Y-%m-%d): ${process_name} is not running" >> "${LOGFILE}"
            sudo ${START_CMD}
        fi
fi

## 4. Write a script - Log analyzer Extract IP addresses and Count most frequent visitors

#/bin/bash

log=$(awk '{print $1}' /var/log/nginx/access.log) | sort | head n -10 
echo ${log}

## 5. Automating Backup of configuration file

#!/bin/bash

src="/etc"
dest="/home/ubuntu/etc_backup"
timestamp=$(date "+%Y-%m-%d-%H:%M:%S")

backup_dir="${dest}/etc-backup-${timestamp}.tar.gz"

tar -czf "${backup_dir}" "${src}"

if [[ $? -eq 0 ]]; then
        echo "Backup has taken"
        find "$backup_dir" -type f -name "etc-backup-*.tar.gz" -mtime +7 -exec rm{}\;
else
        exit 1
fi

## 6. Script of Process Patching

#!/bin/bash
set -e

LOGFILE="/var/log/patching.log"

echo "Patching started: $(date)" | tee -a $LOGFILE

sudo apt update >> $LOGFILE 2>&1
sudo apt upgrade -y >> $LOGFILE 2>&1
sudo apt autoremove -y >> $LOGFILE 2>&1

echo "Patching completed: $(date)" | tee -a $LOGFILE


### Shell Scripts

#### Advanced  Level Answer


##### 1. Write a script to monitor CPU usage and log it with timestamps.
```
#!/bin/bash

monitor=$(mpstat 1 1 | awk '/Average/ {print "CPU Usage:", 100-$12"%"}')
echo "${monitor}"
```

##### 2. Write a script to automatically install packages if not installed.

```
#!/bin/bash

read -p "Enter the package name: " pkg

if [ -z $pkg ]; then
        echo "Need a package name"
        exit 1
fi


if [[ $(! dpkg -l | grep -q "$pkg") ]]; then
        echo "installing package: ${pkg}"
        sudo apt-get install -y ${pkg}
else
        echo "Package has already installed"
fi
```
##### 3. Write a script to send an email when a service goes down.

```
#!/bin/bash

read -p "Enter the service name:" service

if ! systemctl is-active --quiet "$service"; then
        echo "$service is DOWN" | mail -s "Service Alert" vibhutijain393@gmail.com
else
        echo "$service is UP"
fi
```

##### 4. Write a script to check network connectivity (ping test).
```
#!/bin/bash

ping -c 2 google.com > /dev/null

if [ $? -eq 0 ]; then
        echo "Internet is working"
else
        echo "Internet is not working"
fi
```
##### 5. Write a script to parse a CSV file and print selected columns.
```
#!/bin/bash

file=$1

if [ $# -ne 1 ]; then
        echo "Need argument"
        exit 1
fi

parse=$(awk -F, '{print $1}' $1)
echo $parse
```
##### 6. Write a script to create user accounts in bulk from a file.
```
#!/bin/bash

while IFS= read -r user;
do
        [ -z "$user" ] && continue

        if id "$user" &>/dev/null
        then
                echo "${user} is already exists"
        else
                sudo useradd ${user}
                echo "${user} has created"
        fi
done < user.txt
```

##### 7. Write a script to detect and kill high-memory processes.
```
#!/bin/bash
 ps -aux --sort=-%mem | head -5
 pid=$(ps -aux --sort=-%mem | awk 'NR==2 {print $2}')
 kill -9 $pid
```

##### 8. Reverse a string without using rev command.
```
#!/bin/bash

str="HelloWorld"
reversed=""

# Read one character at a time
echo "$str" | while IFS= read -r -n1 char
do
    reversed="$char$reversed"
done

echo "$reversed"
```

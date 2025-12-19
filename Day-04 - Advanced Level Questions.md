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

#!/bin/bash

dir_name="$1"

if [ -z "$dir_name" ]; then
        echo "Needs an argument, Bye Bye... Try Again!!"
        exit 1
fi

result=$(find / -type d -name "$dir_name" 2>/dev/null)

if [ -n "$result" ]; then
        echo "Directory found"
        echo "$result"
else
        echo "Directory doesn't exist or finding incorrect directory"
        echo "Try Again!!!"
fi

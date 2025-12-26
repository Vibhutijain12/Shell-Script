#!/bin/bash

# 1. Print the largest of two numbers

num1=$1
num2=$2

if [ $# -ne 2 ]; then
        echo "Usage of two argument"
        exit 1
fi

if [[ $num1 -ge $num2 ]] && [[ $num2 -le $num1 ]]; then
        echo "$1 is greater than $2"
else
        echo "$2 is greater than $1"
fi

## 2. Accept a username and greet the user

user_name=$1

if [ -z "$user_name" ]; then
        echo "Need user name"
        exit 1
fi

echo "Good Morning!!!, $user_name"

## 3. Check if a file exists, and if yes, show its size

read -p "Enter the file name: " filename

if [ -f $filename ]; then
        echo "file $filename exists"
        echo "the size of $filename is: $(du -sh)"
else
        echo "file $filename doesn't exists"
fi

## 4. Check whether a given string is palindrome or not

name="anna"
reversed=""

while IFS= read -r -n1 char
do
        reversed="$char$reversed"

done <<< "$name"

if [[ "$reversed" == "$name" ]]; then
        echo "string is palindrome"
else
        echo "string is not palindrome"
fi

## 5. Display the first 10 lines of a file

file_name=$1

display=$(cat palindrome.sh | head -n 10)
echo "$display"

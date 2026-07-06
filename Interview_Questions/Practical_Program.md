#### 1. Add two numbers

```sh 
#!/bin/bash

num1=$1
num2=$2

if [ $# -eq 0 ]; then
        echo "Need an argument to continue"
        exit 1
elif [ $# -lt 2 ]; then
        echo "Needs specified number of argument to continue"
        exit 1
else
        sum=$(( num1 + num2 ))
        echo ${sum}
fi
```
#### 2. Find the largest of three numbers

```sh 
#!/bin/bash

num1=$1
num2=$2
num3=$3

if [ $# -eq 0 ]; then
        echo "Something is wrong"
        exit 1
fi

if (( num1 >= num2  &&  num1 >= num3 )) ; then
        echo "${num1} is greater"
elif (( num2 >= num1 && num2 >= num3 )) ; then
        echo "${num2} is greater"
else
        echo "${num3} is greater"
fi
```
#### 3. Check if a number is even or odd

```sh 
#!/bin/bash

num=$1

if [ $# -ne 1 ]; then
        echo "Something is Wrong"
        echo "Try Again!!!"
        exit 1
fi

if (( num % 2 == 0 )); then
        echo "$num is even"
else
        echo "$num is odd"
fi
```
#### 4. Count vowels in a string

```sh 
#!/bin/bash

text="$1"

vowels_count=$(grep -oi '[aeiou]' <<< "$text" | wc -l)

echo "$vowels_count"
```

#### 5. Search for a directory

```sh 
#!/bin/bash

dir_name="$1"

if [ -z "$dir_name" ]; then
        echo "String is empty"
        exit 1
fi

if [ ! -d "$dir_name" ]; then
        echo "directory doesn't exists"
else
        echo "directory exists"
fi
```

```sh
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
```

#### 6. Calculate factorial

```sh 
#!/bin/bash

num=$1

fact=1
temp=$num

if [ $num -lt 0 ]; then
        echo "can't get the factorial of negative numbers"
else
        while [[ $num -gt 1 ]];
        do
                fact=$(( fact * num ))
                num=$(( num - 1 ))
        done
        echo "The factorial of ${temp} is: " ${fact}
fi
```
#### 7. Count words in a file

```sh 
#!/bin/bash

filename="$1"

if [ -z "$filename" ]; then
        echo "Need a string to continue"
        exit 1
fi


while IFS= read -r filename
do
        if echo "$filename" | grep -q "failure"; then
                ((count++))
        fi

done < $filename
echo "The total count of parameters is: " $count
```

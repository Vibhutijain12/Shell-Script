### Shell Scripts

#### Intermediate Level Questions

##### 1. Write a script to find the factorial of a given number.


```
#!/bin/bash

read -p "Enter the number: " num

if [ $num -lt 0 ]; then
        echo "Factorial of negative number can't be find"
        exit 1
fi

fact=1
for (( i=1; i<=$num; i++ ))
do
        fact=$(( fact * i ))
done

echo "The factorial of $num is: " $fact
```

##### 3. Write a script to check whether a string is a palindrome.
```
#!/bin/bash

read -p "Enter any word you want to check: " word
echo ${word}

rever=$(echo ${word} | rev)
echo ${rever}

if [ $word == $rever ]; then
        echo "String is palindrome!!"
else
        echo "String is not palindrome!!"
fi
```

#### 4. Write a script to find the largest of three numbers.
```
#!/bin/bash

a=$1
b=$2
c=$3

if [[ $# -ne 3 ]]; then
        echo "usage of three argument"
        exit 1
fi


if [[ $a -ge $b && $a -ge $c ]]; then
        echo "$a is greater than $c"
elif [[ $b -ge $c && $b -ge $a ]]; then
        echo "$b is  greater than $c"
else
        echo "$c is greater"
fi
```

#### 5. Write a script to read a file line by line.
```
#!/bin/bash

filename=$1


if [[ -z  $filename ]]; then
        echo "Please provide any filename"
        exit 1
fi

while IFS= read -r filename
do
        echo "$filename"
done < $filename
```

#### 6. Write a script to check disk usage and warn if it exceeds 80%.
```
#!/bin/bash

thershold=80
usage=$(df -h | awk 'NR==2 {print $5}' | cut -b 1,2)

if [ ${usage} -ge ${thershold} ]; then
        echo "Warning: Disk usage is at ${usage}% on $(hostname)" | mail -s "Disk Alert: $(hostname)" vibhutijain393@gmail.com
else
        echo "Disk usage is fine: ${usage}%"
fi
```

#### 7. Write a script to find all .txt files in a directory.
```
#!/bin/bash 

find . -type f -name "*txt"

```

##### 8. Write a script to search for a word in a file.
```
#!/bin/bash

WORD="$1"
FILE="$2"

if [ $# -ne 2 ]; then
  echo "Usage: $0 <word> <file>"
  exit 1
fi

grep -n "$WORD" "$FILE"

```

#### 9. Write a script to backup a directory into a compressed tar file.
```
#!/bin/bash

src_dir=/home/ubuntu/shell_scripts
dest=/home/ubuntu/backups

time_stamp=$(date "+%Y-%m-%d-%H-%M-%S")
echo ${time_stamp}

backup_file=${dest}/${time_stamp}.tgz
echo ${backup_file}

tar -czf ${backup_file} ${src_dir}

echo "Backup completed!!!"
```

##### 10. Write a script to count a particular word by reading file. 
```
#!/bin/bash

while IFS= read -r line;
do
        if echo "$line" | grep -q "Yellow";
        then
                ((count++))
        fi

done < color_x11.csv
echo "Total count is: " $count
```

##### 11. Write a script which count a particular letter in a word and print the occurence of the letter. 
```
#!/bin/bash

word="mississippi"
count=$(grep -o "s" <<<"$word" | wc -l)
echo ${count}
```

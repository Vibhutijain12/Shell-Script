### Shell Scripts

#### Beginner Level Questions

##### 1. Write a script to display the current date and time.

```
date

Output - Fri Dec 12 17:59:29 UTC 2025
```

##### 2. Write a script to take a user's name as input and print a greeting.

```
#!/bin/bash

read -p "Enter your name: " name
echo "Hello,${name}!!!!, Good Morning"
```

##### 3. Write a script to add two numbers provided by the user.

```
#!/bin/bash

num1=$1
num2=$2

sum=$((num1 + num2))
echo $sum
```

##### 4. Write a script to check whether a number is even or odd.

```
#!/bin/bash

num=$1
if  ((num % 2 == 0)); then
        echo "Number is even"
else
        echo "Number is odd"
fi
```

##### 5. Write a script to display all files in the current directory.

```
#!/bin/bash

ls -l .
```

##### 6. Write a script to count the number of lines in a file.
```
#!/bin/bash
read -p "Enter the filename: " file_name

echo "there are $(wc -l $file_name) lines"
```

##### 7. Write a script to check if a file exists.
```
#!/bin/bash

read -p "Enter the  file name want to check wheather exists or not"

read file

if [ -f ${file} ]; then
        echo "File exists"
else
        echo "File is not there in the system"
fi
```

##### 8. Write a script to show the current working directory.
```
#!/bin/bash 

pwd
```

##### 9. Write a script to print the first 10 natural numbers using a loop.
```
#!/bin/bash

i=1
while [ $i -le 10 ]
do
        echo "${i}"
        ((i++))
done
```
##### 10. Write a script to calculate the age of a person. 
```
#!/bin/bash

read -p "Enter the current year: " curr_year
read -p "Enter your birth year: " birth_year

if [ -z "$curr_year" ] || [ -z "$birth_year" ]; then
        echo "Need some input from user side"
        exit 1
fi

age_cal=$((curr_year - birth_year))

echo "Your primary age is: ${age_cal}"
```

##### 11. Check if a file exists, and if yes, show its size
```
#!/bin/bash

file=$1

if [ -z "$file" ]; then
        echo "Need filename to print size"
        exit 1
fi


if [ ! -f $file ]; then
        echo "file doesn't exists"
else
        echo "file exists"
        du -h $file
fi
```


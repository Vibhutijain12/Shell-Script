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

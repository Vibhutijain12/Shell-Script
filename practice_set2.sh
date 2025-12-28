## 1. write a script to perform basic arithmetic operations (addition, subtraction, multiplication, division) using functions and conditional statements.

!/bin/bash

read -p "Enter num1 value: " num1
read -p "Enter num2 value: " num2


read -p "Enter your operator: " sel

function add() {
        return $((num1+num2))
}

function sub() {
        return $((num1-num2))
}

function mul() {
        return $((num1*num2))
}

function div() {
        return $((num1/num2))
}


if [[ $sel -eq 1 ]]; then
        add $num1 $num2
        echo "The sum of ${num1} and ${num2} is: $((num1+num2))"

elif [[ $sel -eq 2 ]]; then
        sub $num1 $num2
        echo "The sub of ${num1} and ${num2} is: $((num1-num2))"

elif [[ $sel -eq 3 ]]; then
        mul $num1 $num2
        echo "The mul of ${num1} and ${num2} is: $((num1*num2))"

elif [[ $sel -eq 4 ]]; then
        div $num1 $num2
        echo "The div of ${num1} and ${num2} is: $((num1/num2))"
else
        echo "Provide valide input"
fi

## 2. write a script to count the number of files in a directory.

path=$1

count=$(find "$path"/*.sh -type f | wc -l)
echo $count

## 3. Display system uptime, date, and current user

echo $(uptime)
echo $(date)
echo $(whoami)

## 4. Check if a given year is a leap year


read -p "Enter the year: " year

if [[ $year%4 == 0 ]]; then
        echo "$year is leap year"
else
        echo "$year is not leap year"
fi

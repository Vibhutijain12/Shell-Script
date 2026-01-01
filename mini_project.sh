### 1. Mini Project 1: Contact Book

#/bin/bash

filename="contact.txt"

if [[ ! -f "$filename" ]]; then
        echo "File doesn't exist, Please create ${filename}"
        touch ${filename}
else
        echo "File exists"
fi

while true
do
    echo "---------------------------"
    echo "      CONTACT BOOK"
    echo "---------------------------"
    echo "1. Add Contact"
    echo "2. Search Contact"
    echo "3. Delete Contact"
    echo "4. List All Contacts"
    echo "5. Exit"
    echo "---------------------------"
    read -p "Enter your choice: " choice

    case $choice in
            1)
                    read -p "Enter the name of the person: " name
                    read -p "Enter the phone number: " phone

                    echo "$name | $phone" >> ${filename}
                    echo "Contact added successfully"
                    ;;
            2)
                    read -p "Enter the contact wanted to search: " search
                    grep -i "$search" $filename || echo "Contact not found"
                    ;;
            3)
                    read  -p "Enter the contact wanted to del: " del
                    if grep -i "$del" $filename; then
                         grep -iv "$del" $filename > file1.txt
                         mv file1.txt $filename
                         echo "Contact deleted succesfully"
                    else
                         echo "Contact not found"
                    fi
                    ;;
             4)
                    if [ -s $filename ]; then
                          cat $filename
                    else
                          echo "No contact available"
                    fi
                    ;;
             5)
                    echo "Exiting from the contact book"
                    exit
                    ;;
             *)
                    echo "Invalid input, Try Again!!!!"
                    ;;
        esac
done


## 2. Mini Project 2: Student Grading System 

#!/bin/bash


function grades(){ 

    read -p "Enter the maths marks: " maths
    read -p "Enter science marks: " science
    read -p "Enter english marks: " english
    read -p "Enter hindi marks: " hindi
    read -p "Enter SST marks: " sst

    total=$((maths + science + english + hindi + sst))
    percent=$(( total * 100 / 500 ))

    if [[ $percent -ge 90 ]] && [[ $percent -le 100 ]]; then
       echo "You Passed the exam with flying colors!!!!, Execellent"
    elif [[ $percent -ge 80 ]] && [[ $percent -le 89 ]]; then
       echo "You Passed the exam!!!, Very good"
    elif [[ $percent -ge 70 ]] && [[ $percent -le 79 ]]; then
       echo "You Passed the exam with Average marks!!!, Satisfactory"
    elif [[ $percent -ge 60 ]] && [[ $percent -le 69 ]]; then
       echo "You Passed the exam with minimum numbers, Work Hard"
    else
        echo "You Failed the exam"
    fi
}

grades


## Mini Project 3: Password Generator using Generate random secure password using /dev/urandom

#!/bin/bash

read -p "Enter the length of the password: " len

if [ -z $len ]; then
        echo "Need an input to generate the password"
        exit 1
else
        length=${#len}
        tr -dc 'A-Za-z0-9!@#$%^&*()-_=+' </dev/urandom | head -c 8
        echo


        for p in $(seq 1);
        do
             openssl rand -base64 48 | cut -c1-$len
        done
fi

## Mini Project 4: User Creation Automation

#!/bin/bash


file_name=users.txt
passord_length=12

if [[ $EUID -ne 0 ]]; then
        echo "To add user in the system, you need root user"
        exit 1
fi

echo "You are the root user, you can contiune..."

if [[ ! -f "$file_name" ]]; then
        echo "File doesn't exists!!!"
        exit 1
fi

while IFS= read -r user; do
        [ -z "$user" ] && contiune

        if id "$user" 2>/dev/null; then
                echo "$user is already created"
                continue
        fi

        password=$(openssl rand -base64 48 | cut -c1-${password_length})

        useradd -m "$user"

#       echo "$user|$password" | chpasswd

#       chage -d 0 "$user"

        echo "User: $USER  Password: $PASSWORD"

done < users.txt

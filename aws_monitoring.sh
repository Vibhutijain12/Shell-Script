##### Write a script to Monitor the AWS resource. 

#!/bin/bash

#####################################################################################################
# Author: Vibhuti
# Date: 03-02-2026
# Information: This script will track the usage of AWS resoures
# Tracked Services: S3, EC2, Lambda, IAM
# ###################################################################################################

# this command will help you to debug the commands

set -x

# List all the s3 bucket
echo "Prints the list of S3 buckets"
aws s3 ls

# List all the EC2 instance available in the AWS account
echo "Print the list of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List all the lambda functions
echo "Print the list of the lambda functions"
aws lambda  list-functions

# List all the IAM users
echo "Prints the lists of the iam users"
aws iam list-users | jq '.Users[].UserName'

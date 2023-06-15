#!/bin/bash

myip=$(curl -s https://api.ipify.org)


region="ap-south-1"
security_group_name="jenkins(security_group)"
#load_balancer_name="albpushpitjenkins"

security_group_id=$(aws ec2 describe-security-groups --filters Name=group-name,Values="jenkins(security_group)" --query "SecurityGroups[0].GroupId" --output text --profile pushpit)


aws ec2 authorize-security-group-ingress --group-id sg-068a5fad8603dd055 --protocol all --port 443 --cidr $myip/32 --profile pushpit

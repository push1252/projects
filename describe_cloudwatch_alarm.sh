#!/bin/bash

# Set the AWS region
AWS_REGION="your-aws-region"

# Get a list of all EC2 instances in the region
EC2_INSTANCE_IDS=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text --profile pushpit

# Loop through each EC2 instance
for INSTANCE_ID in $EC2_INSTANCE_IDS; do
  # Get a list of all CloudWatch alarms for the instance
  ALARMS=$(aws cloudwatch describe-alarms-for-metric --metric-name CPUUtilization --namespace AWS/EC2 --dimensions Name=InstanceId,Value=$INSTANCE_ID --query 'MetricAlarms[*].AlarmName' --output text --profile gromoinsure)

  # If there are no alarms for the instance, print a message
  if [ -z "$ALARMS" ]; then
    echo "Instance $INSTANCE_ID has no CloudWatch alarms."
  fi
done


#!/bin/bash

#PROFILE_NAMES=("iopshub")

for PROFILE in $(aws configure list-profiles | grep -v default)
do
    echo "Volumes available in profile $PROFILE:"
    aws ec2 describe-volumes --filters Name=status,Values=available --query 'Volumes[*].{ID:VolumeId}' --output table --profile $PROFILE
done



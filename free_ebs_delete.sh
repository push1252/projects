#!/bin/bash

while getopts "r:v:p:" opt; do
  case $opt in
    r) REGION="$OPTARG";;
    v) VOLUME_ID="$OPTARG";;
    p) PROFILE="--profile $OPTARG";;
    *) echo "Invalid option"; exit 1;;
  esac
done

if [[ -z $REGION || -z $VOLUME_ID ]]; then
  echo "Missing required parameter(s). Usage: delete_ebs_volume.sh -r <region> -v <volume-id> [-p <profile>]"
  exit 1
fi

aws ec2 delete-volume --region $REGION $PROFILE --volume-id $VOLUME_ID


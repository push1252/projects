#!/bin/bash

# List of queue URLs to be deleted
queue_urls=(
    "https://ap-south-1.queue.amazonaws.com/812175807951/update-create-data-on-crm-dev"
"https://ap-south-1.queue.amazonaws.com/812175807951/pos-update-from-insurance-dev"
"https://ap-south-1.queue.amazonaws.com/812175807951/update-policy-issued-count-dev"
"https://ap-south-1.queue.amazonaws.com/812175807951/reminder-from-insurance-dev"
"https://ap-south-1.queue.amazonaws.com/812175807951/update-vehicle-data-dev"
)

# Loop through the queue URLs and delete each queue
for url in "${queue_urls[@]}"
do
    # Delete the queue using the AWS CLI
    aws sqs delete-queue --queue-url "$url" --profile gromoappbackend

    # Check the exit code of the AWS CLI command
    if [ $? -eq 0 ]; then
        echo "Queue deleted successfully: $url"
    else
        echo "Error deleting queue: $url"
    fi
done


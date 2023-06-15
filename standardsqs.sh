#!/bin/bash

# List of queue names
queue_names=("details-update")

# Loop through the list of queue names
for queue_name in "${queue_names[@]}"
do
  # Create the queue
  aws sqs create-queue --queue-name "$queue_name" --attributes '{"KmsMasterKeyId": ""}' --profile pushpit
 

  # Check if the queue was created successfully
  if [ $? -eq 0 ]; then
    echo "Queue $queue_name created successfully."
  else
    echo "Failed to create queue $queue_name."
  fi
done


#!/bin/bash

rds_instances=("staging-rds" "production-rds")

for rds_instance in "${rds_instances[@]}"; do
    backup=$(aws rds describe-db-instances --db-instance-identifier "$rds_instance" --query 'DBInstances[0].BackupRetentionPeriod' --output text --profile pushpit)

    if [ "$backup" -gt 0 ]; then
        echo "Backup is enabled for $rds_instance"
    else
        echo "Backup is not enabled for $rds_instance"
    fi
done

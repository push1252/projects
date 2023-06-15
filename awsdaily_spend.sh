#!/bin/bash

#start_date=$(2023-03-01)
#end_date=$(2023-04-25)


aws ce get-cost-and-usage --no-cli-auto-prompt --profile app-back --time-period Start='2023-04-26',End='2023-04-29' --granularity DAILY --metrics "UnblendedCost" --filter '{"Not": {"Dimensions": {"Key": "RECORD_TYPE","Values": ["Credit"]}}}' | jq -r '.ResultsByTime[] | [.TimePeriod.Start,.Total.UnblendedCost.Amount] | @csv'

#!/bin/bash

# Function to check which students haven't submitted
check_pending_submissions() {
  while IFS=',' read -r name status; do
    if [ "$status" != "submitted" ]; then
      echo "Reminder: $name $REMINDER_MESSAGE"
    fi
  done < ../data/submissions.txt
}

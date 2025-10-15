#!/bin/bash
# Reminder script for submission_reminder_app
source ./functions.sh
source ./config.env

sub_file="./submissions.txt"

echo "Checking non-submissions for $ASSIGNMENT..."
check_submissions "$sub_file"

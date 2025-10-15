#!/bin/bash
# Script: copilot_shell_script.sh
# Purpose: Update assignment name in config.env and check submissions

# Prompt user for new assignment name
read -p "Enter the new assignment name: " new_assignment

# Replace the ASSIGNMENT value in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" ./config.env

echo "Assignment updated to '$new_assignment' in config.env"

# Run startup.sh to check students who have not submitted
./startup.sh


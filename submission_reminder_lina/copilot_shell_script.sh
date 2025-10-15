#!/bin/bash
# Prompt user for new assignment name
read -p "Enter new assignment name: " new_assignment

# Update config.env (replace {yourName} with your actual folder name if needed)
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" submission_reminder_tiffany/config/config.env

echo "✅ Assignment name updated to '$new_assignment'"

# Run the app for updated assignment
bash submission_reminder_tiffany/scripts/startup.sh


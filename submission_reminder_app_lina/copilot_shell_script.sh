#!/bin/bash

# ============================================
# Script: copilot_shell_script.sh
# Author: Tiffany Lina
# Description: Updates assignment name in config.env
# ============================================

# Ask for the new assignment name
read -p "Enter new assignment name: " new_assignment

# Replace assignment name in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" submission_reminder_tiffany/config/config.env

echo "✅ Assignment name updated to '$new_assignment'"

# Rerun startup.sh to check reminders for new assignment
bash submission_reminder_tiffany/scripts/startup.sh


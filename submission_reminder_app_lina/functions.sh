#!/bin/bash
# Functions/codes for submission_reminder_app

check_submissions() {
    local file="$1"
    echo "Students who have NOT submitted:"
    awk -F, '$3=="no"{print $1, $2}' "$file"
}


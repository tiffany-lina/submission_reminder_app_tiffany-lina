#!/bin/bash
source ../config/config.env
source ./functions.sh

echo "Checking student submissions for $ASSIGNMENT..."
check_pending_submissions

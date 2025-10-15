#!/bin/bash

# ============================================
# Script: create_environment.sh
# Author: Tiffany Lina
# Description: Sets up submission reminder app
# ============================================

read -p "Enter your name: " name
main_dir="submission_reminder_${name}"

mkdir -p ${main_dir}/{config,scripts,data,assets}

# Create files
touch ${main_dir}/config/config.env
touch ${main_dir}/scripts/{reminder.sh,functions.sh,startup.sh}
touch ${main_dir}/data/submissions.txt
touch ${main_dir}/assets/image.png

# Populate config.env
cat <<EOL > ${main_dir}/config/config.env
ASSIGNMENT="Linux Assignment"
REMINDER_MESSAGE="You have not submitted your assignment!"
EOL

# Populate functions.sh
cat <<'EOL' > ${main_dir}/scripts/functions.sh
#!/bin/bash
check_pending_submissions() {
  while IFS=',' read -r name status; do
    if [ "$status" != "submitted" ]; then
      echo "Reminder: $name $REMINDER_MESSAGE"
    fi
  done < ../data/submissions.txt
}
EOL

# Populate reminder.sh
cat <<EOL > ${main_dir}/scripts/reminder.sh
#!/bin/bash
source ../config/config.env
source ./functions.sh

echo "Checking student submissions for \$ASSIGNMENT..."
check_pending_submissions
EOL

# Populate submissions.txt
cat <<EOL > ${main_dir}/data/submissions.txt
Alice,submitted
Bob,not submitted
Charlie,submitted
Diana,not submitted
Eve,submitted
Frank,not submitted
Grace,not submitted
Hannah,submitted
Ivan,not submitted
Judy,submitted
EOL

# Create startup.sh
cat <<EOL > ${main_dir}/scripts/startup.sh
#!/bin/bash
echo "Starting Submission Reminder App..."
bash ./reminder.sh
EOL

chmod +x ${main_dir}/scripts/*.sh
echo "✅ Environment setup complete!"
echo "Directory created: ${main_dir}"


#!/bin/bash

# Prompt for your name
read -p "Enter your name: " name

# Define main directory
main_dir="submission_reminder_${name}"

# Create the main directory and subdirectories
mkdir -p ${main_dir}/{config,scripts,data,assets}

# Create the files
touch ${main_dir}/config/config.env
touch ${main_dir}/scripts/{reminder.sh,functions.sh,startup.sh}
touch ${main_dir}/data/submissions.txt
touch ${main_dir}/assets/image.png

# Add content to config.env
cat <<EOL > ${main_dir}/config/config.env
ASSIGNMENT="Linux Assignment"
REMINDER_MESSAGE="You have not submitted your assignment!"
EOL

# Add content to reminder.sh
cat <<EOL > ${main_dir}/scripts/reminder.sh
#!/bin/bash
source ../config/config.env
source ./functions.sh

echo "Checking student submissions for \$ASSIGNMENT..."
check_pending_submissions
EOL

# Add content to functions.sh
cat <<'EOL' > ${main_dir}/scripts/functions.sh
#!/bin/bash

check_pending_submissions() {
  while IFS=',' read -r name status; do
    if [ "\$status" != "submitted" ]; then
      echo "Reminder: \$name \$REMINDER_MESSAGE"
    fi
  done < ../data/submissions.txt
}
EOL

# Add content to submissions.txt (sample + 5 new students)
cat <<EOL > ${main_dir}/data/submissions.txt
Alice,submitted
Bob,not submitted
Charlie,submitted
Diana,not submitted
Eve,submitted
Frank,not submitted
Grace,submitted
Hannah,not submitted
Ivan,submitted
Judy,not submitted
EOL

# Create the startup.sh script
cat <<EOL > ${main_dir}/scripts/startup.sh
#!/bin/bash
echo "Starting Submission Reminder App..."
bash ./reminder.sh
EOL

# Make all .sh files executable
chmod +x ${main_dir}/scripts/*.sh

echo "✅ Environment setup complete! Directory created: ${main_dir}"


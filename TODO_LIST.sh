#!/bin/bash

# Define Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[36m"
RESET="\e[0m"

# Define the path for the task script and log file
Path="/home/muhamed/ODC/project/task.sh"
LogPath="/home/muhamed/ODC/project/output.log"

# Check if the Task file exists
if [[ ! -f $Path ]]; then
    # Create the task script file
    echo "#!/bin/bash" > $Path 
    echo "export DISPLAY=:0" >> $Path
    echo "export DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1000/bus\"" >> $Path

    # Write the content to log the message and send a notification
    echo "message=\$1" >> $Path  
    echo "echo \"\$message\" >> $LogPath" >> $Path
    echo "notify-send -t 2000 \"Notification\" \"\$message\"" >> $Path
fi

# Function to Print a Cool Header
print_header() {
echo -e "${GREEN}**************************************${RESET}"
echo -e "${GREEN}*       ENTER THE TASK YOU WANT     *${RESET}"
echo -e "${GREEN}**************************************${RESET}"
echo -e "${YELLOW}Please enter the task time and description  below:${RESET}"
echo ""

    
}

# Function to Get Valid Year
get_year() {
    while true; do
        echo -e "${YELLOW}Enter the Year (2025-2100):${RESET}"
        read -p "➤ " year
        if [[ "$year" =~ ^[0-9]+$ && "$year" -ge 2025 && "$year" -le 2100 ]]; then
            break
        else
            echo -e "${RED}⚠ Invalid year! Please enter a valid year (2025-2100).${RESET}"
        fi
    done
}

# Function to Get Valid Month
get_month() {
    while true; do
        echo -e "${YELLOW}Enter the Month (1-12):${RESET}"
        read -p "➤ " month
        if [[ "$month" =~ ^[0-9]+$ && "$month" -ge 1 && "$month" -le 12 ]]; then
            break
        else
            echo -e "${RED}⚠ Invalid month! Please enter a value between 1 and 12.${RESET}"
        fi
    done
}

# Function to Get Valid Day
get_day() {
    while true; do
        echo -e "${YELLOW}Enter the Day (1-31):${RESET}"
        read -p "➤ " day
        if [[ "$day" =~ ^[0-9]+$ && "$day" -ge 1 && "$day" -le 31 ]]; then
            break
        else
            echo -e "${RED}⚠ Invalid day! Please enter a value between 1 and 31.${RESET}"
        fi
    done
}

# Function to Get Valid Hour
get_hour() {
    while true; do
        echo -e "${YELLOW}Enter the Hour (0-23):${RESET}"
        read -p "➤ " hour
        if [[ "$hour" =~ ^[0-9]+$ && "$hour" -ge 0 && "$hour" -le 23 ]]; then
            break
        else
            echo -e "${RED}⚠ Invalid hour! Please enter a value between 0 and 23.${RESET}"
        fi
    done
}

# Function to Get Valid Minute
get_minute() {
    while true; do
        echo -e "${YELLOW}Enter the Minute (0-59):${RESET}"
        read -p "➤ " min
        if [[ "$min" =~ ^[0-9]+$ && "$min" -ge 0 && "$min" -le 59 ]]; then
            break
        else
            echo -e "${RED}⚠ Invalid minute! Please enter a value between 0 and 59.${RESET}"
        fi
    done
}

# Call Functions to Get Inputs
print_header
get_year
get_month
get_day
get_hour
get_minute

# Get the Notification Message
echo -e "${YELLOW}Enter the message for the popup:${RESET}"
read -p "➤ " message
echo ""

# Display Calendar
echo -e "${BLUE}📅 Selected Date:${RESET}"
cal $month $year
echo ""

# Display Confirmation
echo -e "${GREEN}✔ Scheduling Task...${RESET}"

# Schedule the Task
echo "bash $Path '$message'" | at $hour:$min $month/$day/$year

# Final Output
echo -e "${GREEN}✅ Scheduled notification at ${BLUE}$hour:$min on $month/$day/$year${RESET}"

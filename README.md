# Task Scheduler Script 🎯📅✅

## Description 📜💻🔔

This Bash script allows users to schedule notifications on their Linux system by entering a date, time, and a message. The script sets up a task script that logs the message and sends a notification using `notify-send`. The scheduled task is executed at the specified time using the `at` command.

## Features 🌟⚙️📝

- User-friendly interactive input for scheduling tasks
- Input validation for date and time
- Uses `notify-send` to display desktop notifications
- Logs messages to a file for reference
- Displays a confirmation message before scheduling

## Prerequisites 📌📂📎

Ensure the following dependencies are installed on your Linux system:

- `at` command (install with `sudo apt install at` if not available)
- `notify-send` (part of `libnotify-bin`, install with `sudo apt install libnotify-bin`)

## Installation 🚀🔧📂

1. Give execution permissions:
   ```bash
   chmod +x task.sh
   chmod +x scheduler.sh
   ```
2. Ensure the `atd` service is running:
   ```bash
   sudo systemctl start atd
   sudo systemctl enable atd
   ```

## Usage 🖥️🕒✅

Run the script using:

```bash
./scheduler.sh
```

Then, follow the prompts to:

1. Enter the date and time for the notification.
2. Provide the message to be displayed.
3. Confirm the scheduled task.

## Example 📅✍️🔔

```
**************************************
*       ENTER THE TASK YOU WANT     *
**************************************
Please enter the task time and description below:

Enter the Year (2025-2100):
➤ 2025
Enter the Month (1-12):
➤ 5
Enter the Day (1-31):
➤ 20
Enter the Hour (0-23):
➤ 14
Enter the Minute (0-59):
➤ 30
Enter the message for the popup:
➤ Meeting with the team
📅 Selected Date:
     May 2025
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

✔ Scheduling Task...
✅ Scheduled notification at 14:30 on 5/20/2025
```

## Logs 📜📝📂

All scheduled messages are logged in:

```
output.log
```

## Notes 🛠️⚠️📢

- The script ensures that a valid date and time are entered.
- The `at` command handles the task scheduling.
- Ensure `atd` service is running to process scheduled tasks.

## Author ✍️👨‍💻🎓

Developed by Mohemad.


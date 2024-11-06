# threathunting-lab
## In order for this to work, have to clone using this command:

git clone https://github.com/Graymos/threathunting-lab.git /tmp/totally-innocent

## Then make scripts executable:
chmod +x /tmp/totally-innocent/totally-innocent-not-start-of-persistence.sh

chmod +x /tmp/totally-innocent/panix.sh

## To make it work on your system:

Will need to go into the /tmp/totally-innocent/totally-innocent-not-start-of-persistence.sh script and change ip/port/ssh pubkeys to your specifications.

## Running the script
Only run the totally-innocent-not-start-of-persistence.sh script with both sudo and not sudo to get maximum persistence:

cd /tmp/totally-innocent 
./totally-innocent-not-start-of-persistence.sh
sudo ./totally-innocent-not-start-of-persistence.sh


## Included persistence methods:
- Services
- Admin User (named sloppyjoe) with authorized keys and ssh keys persistence
- at job (set to run a reverse shell in 24 hours)
- Authorized keys persistence
- MOTD
- CRON
- ssh-keys


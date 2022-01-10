#!/bin/zsh

# Quick change dir to "Super-Vault" containing all obsidian vault
cdobs() {
    # Chage Directory to Path super-vault
    ## How to change dir in script: https://askubuntu.com/questions/481715/why-doesnt-cd-work-in-a-shell-script
    cd "$PATH_OBS_SUPERVAULT"
    if [ $? = "0" ]; then
        echo "👋 Changed directory to Obsidian super-vault:\n${PATH_OBS_SUPERVAULT}"
    fi
}

# Open Obsidian app & Shell at super-vault directory
obs_open() {
    cdobs
    open -a Obsidian
    echo "👨‍💻 Open Obsidian.app"
}

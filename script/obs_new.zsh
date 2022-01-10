#!/bin/zsh

# Create Obsidian Vault folder
obs_new() {
    # Setting
    PATH_NEW="$PATH_OBS_SUPERVAULT/$1"
    PATH_obsGlobal="${PATH_OBS_SUPERVAULT}/_obsconfig/.obsGlobal"
    PATH_tempGlobal="${PATH_OBS_SUPERVAULT}/_obsconfig/tempGlobal"
    ## Check if already have this vault
    if [ -e $PATH_NEW ]; then
        echo "Already have $1 vault"
        return
    fi
    # 1. Crate vault under iClould path with name as $1
    ## New Dir
    mkdir $PATH_NEW
    if [ $? != "0" ]; then
        echo "Can't create directory"
    fi
    ## Enter $1 directory
    cd $PATH_NEW
    if [ $? = "0" ]; then
        echo "📁 New $1 Obsidian vault as a child of super-vault \"$SUPERVAULT\" at:\n $PATH_OBS_SUPERVAULT"
    fi
    # 2. Symlink `.obsGlobal` from ../_obsconfig/.obsGlobal
    mkdir .obsGlobal
    ln -s "$PATH_obsGlobal"/* .obsGlobal/
    if [ $? = "0" ]; then
        echo "🔗 Link files in $1/.obsGlobal to files in:\n $PATH_obsGlobal"
    fi
    ## CHECK & REMOVE: these files because intend to be unique per vault.
    for i in "$FILE_NOT_LINK[@]"; do
        if [ -L $i ]; then
            # ls -a $i
            rm -f $i
            if [ $? = "0" ]; then
                echo "❌ Removed these symbolic link to _obsconfig\n- $i"
            fi
        fi
    done

    # 3. Symlink `tempGlobal` from ../_obsconfig/tempGlobal
    ln -s "$PATH_tempGlobal"
    if [ $? = "0" ]; then
        echo "🔗 Link tempGlobal from: $PATH_tempGlobal"
    fi

    # 4. Add README & Setting Steps
    ## Here Scripting technique: https://www.cyberciti.biz/faq/using-heredoc-rediection-in-bash-shell-script-to-write-to-file/
    README="README.md"

    cat <<EOF >${README}
# $1 
### TODO:
- [ ] To enable shared global settings, go to Settings -> About -> Override config folder with: \`.obsGlobal\` then relaunch.
- [ ] Every files in \`.obsGlobal\` and \`tempGlobal\` folder are linked to \`_obsconfig\`, except for \`.obsGlobal/workspace\` and \`.obsGlobal/appearance.json\` files will be unique to this vault.
EOF

    echo "📖 Create README.md"

    # 5. Open App
    # open -a Obsidian
    # echo "👨‍💻 Open Obsidian.app"
    # Clean Up
    unset PATH_OBS_HELP_dot_obsidian PATH_NEW PATH_obsGlobal PATH_tempGlobal FILE_NOT_LINK README
    ## To remove func: unset -f obs
    ## To remove variable: unset var

}

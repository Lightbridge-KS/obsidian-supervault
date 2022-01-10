#!/bin/zsh

# Build `_obsconfig`

## Some how this can't be used ??
# PATH_OBS_CONFIG=$(echo "$PATH_OBS_CONFIG_PARENT/_obsconfig")
# echo $PATH_OBS_CONFIG
# mkdir "$PATH_OBS_CONFIG"
_FILE_NOT_COPY_FROM_DOT_OBS="workspace"

## Create `_obsconfig`
obs_new_obsconfig() {
    if [ -e "$PATH_OBS_CONFIG_PARENT/_obsconfig" ]; then
        echo "Already have _obsconfig directory at $PATH_OBS_CONFIG_PARENT/_obsconfig"
        return
    fi
    # 1.Create `_obsconfig` and `_obsconfig/tempGlobal`directory
    mkdir "$PATH_OBS_CONFIG_PARENT/_obsconfig"
    mkdir "$PATH_OBS_CONFIG_PARENT/_obsconfig/tempGlobal"

    if [ $? = "0" ]; then
        echo "✨ Create '_obsconfig' and '_obsconfig/tempGlobal' directory at: $PATH_OBS_CONFIG_PARENT"
    fi

    # Copy .obsidian from Help Vault to `_obsconfig`
    cp -r "$PATH_OBS_HELP_VAULT/.obsidian" "$PATH_OBS_CONFIG_PARENT/_obsconfig"
    if [ $? = "0" ]; then
        echo -n "📑 Copy .obsidian from Help Vault to _obsconfig "
    fi
    ### But, Remove some file
    cd "$PATH_OBS_CONFIG_PARENT/_obsconfig/.obsidian"
    rm $_FILE_NOT_COPY_FROM_DOT_OBS
    if [ $? = "0" ]; then
        echo "except for $_FILE_NOT_COPY_FROM_DOT_OBS"
    fi
    # Enter `_obsconfig` dir
    cd "$PATH_OBS_CONFIG_PARENT/_obsconfig"
    if [ $? = "0" ]; then
        echo "🛬 Change directory to $PATH_OBS_CONFIG_PARENT/_obsconfig"
    fi

}

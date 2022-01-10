#!/bin/zsh

# Source Script ? (Already when startup)
# source ./obs_helper.zsh

# obs

### Wrapper Function

usage() {
    echo "usage: "obsidian" [[open] [new Vault-Name]] | [help]]"
}

obsidian() {

    if [ "$1" = "" ]; then
        usage
    fi

    while [ "$1" != "" ]; do
        case $1 in
        open)
            obs_open
            ;;
        new)
            shift
            obs_new $1
            ;;
        new_obsconfig)
            obs_new_obsconfig
            ;;
        help)
            usage
            ;;
        *)
            echo "Incorrect option"
            echo "$1 is not a valid obsidian command, please see:\n"
            usage
            return
            ;;
        esac
        shift
    done

}

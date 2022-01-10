#!/bin/zsh

# Must Fill ----------------------------------------------------
### Please provide absolute path to super-vault
PATH_OBS_SUPERVAULT='/Users/kittipos/Library/Mobile Documents/iCloud~md~obsidian/Documents'
### Path to "Obsidian help" vault
PATH_OBS_HELP_VAULT='/Users/kittipos/Library/Application Support/obsidian/Obsidian Help'

# Optional ----------------------------------------------------
### Path to _obsConfig
PATH_OBS_CONFIG_PARENT="$PATH_OBS_SUPERVAULT"
# PATH_OBS_CONFIG_PARENT="/Users/kittipos/Desktop/test"

### Config Files that will be Unique in each vault
FILE_NOT_LINK=(".obsGlobal/workspace" ".obsGlobal/appearance.json")
# echo ${FILE_NOT_LINK[@]}
# ----------------------------------------------------

# Other Setting
### Basename of super-vault
SUPERVAULT=${PATH_OBS_SUPERVAULT##*/} ### How to extract basename: https://www.cyberciti.biz/faq/bash-get-basename-of-filename-or-directory-name/
### Path to `.obsidian` of "Obsidian help" vault
# PATH_OBS_HELP_dot_obsidian="$PATH_OBS_HELP_VAULT/.obsidian"

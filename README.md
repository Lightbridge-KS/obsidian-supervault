# Obsidian Super-Vault (In Development)

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

> leverage mulitiple [Obsidian](https://obsidian.md) Vault in the same parent **"Super-Vault"** folder with shared global settings such as hotkeys, plugins, templates.

## Structures

- **Super-Vault**
	- **`_obsconfig/`** 
		- `.obsGlobal/`
		- `tempGlobal/`
	- User_Vault_1
		- `.obsGlobal` (symlink files [Ω](#ω))
		- `tempGlobal` (symlink to `_obsconfig/tempGlobal`)
		- `.obsidian` (unique per vault)
    - User_Vault_2 ...


#### Ω 

All files in this `.obsGlobal` of each vault will soft-linked to files in `_obsconfig/.obsGlobal`, except for these files:

 - `.obsGlobal/workspace`: contain workspace
 - `.obsGlobal/appearance.json`: contain theme settings

These files will be unique in each vault so that each vault can have different theme & workspace setting.

## Why build this structures

In case that you want to seperate unrelated topics in mulitiple different vaults, [Obsidian](https://obsidian.md) can build seperate vaults with each has its own seperate environments. When you update setting of one vault, e.g. install plugins or change keyboard shortcuts, you have to change the other vaults as well, which might be time consuming.

This shell scripts build around soft-link file structures to link each obsidian vault to global configuration directory `.obsGlobal/` and templates folder `tempGlobal/`. This will result in the way that user will need to set hotkeys, plugins, templates *once* and the settings will be updated across all vaults that located in super-vault directory. 



Also Inspired from [this feature request](https://forum.obsidian.md/t/global-settings/1364).


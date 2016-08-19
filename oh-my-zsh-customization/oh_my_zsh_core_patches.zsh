function upgrade_oh_my_zsh () {
	env ZSH=$ZSH /bin/sh $ZSH_CUSTOM/tools/upgrade.sh
}

zsh-update() { upgrade_oh_my_zsh }
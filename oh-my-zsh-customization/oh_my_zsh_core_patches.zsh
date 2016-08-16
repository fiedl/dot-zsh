function upgrade_oh_my_zsh () {
	env ZSH=$ZSH /bin/sh $ZSH_CUSTOM/tools/upgrade.sh
}

function _upgrade_zsh() {
  env ZSH=$ZSH sh $ZSH_CUSTOM/tools/upgrade.sh
  # update the zsh file
  _update_zsh_update
}
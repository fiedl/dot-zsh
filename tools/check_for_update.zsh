# In order to have the oh-my-zsh chec-for-upgrade script
# use the modified upgrade script that will also update
# ~/.zsh, we need to change the directory oh-my-zsh looks
# for the upgrade script.
#
# To test the process, decrease the number stored in
# ~/.zsh-update

export OH_MY_ZSH_PATH="$ZSH"
ZSH="$ZSH_CUSTOM"
source "$OH_MY_ZSH_PATH/tools/check_for_upgrade.sh"
ZSH="$OH_MY_ZSH_PATH"
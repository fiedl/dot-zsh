# ## Updating the zsh configuration
#
# These commands help to sync the zsh configuration up and down.
# Through the oh-my-zsh auto update process, the repo is down-synced
# automatically. This is prevented by uncommited changes in ~/.zsh.
#
# Quickly commit and push local changes:
#
#     zsh-push
#
# If needed, with commit message:
#
#     zsh-push I added cool stuff ...
#
# Get latest changes by running one of these:
#
#     zsh-pull
#     zsh-update
#
zsh-push() {
  cd ~/.zsh
  zsh-update-documentation
  git add .
  git commit --message "$*" --all --message="Updating zsh configuration at $(date)."
  git push origin master
}
zsh-pull() { zsh-update }
zsh-update() { upgrade_oh_my_zsh }

# `zsh-push` will update the documentation in the README automatically.
# But it may be run manually, e.g. before committing manually.
#
#     zsh-update-documentation
#
zsh-update-documentation() {
  ruby $ZSH_CUSTOM/plugins/fiedl/bin/update_documentation.rb
}

# To edit the plugin "welcome", just type:
#
#     zsh-plugin welcome
#     plugin welcome
#
zsh-plugin() {
  take "$ZSH_CUSTOM/plugins/$1"
  e "$ZSH_CUSTOM/plugins/$1/$1.plugin.zsh"
}
alias plugin='zsh-plugin'


# ## Automated updates
#
# This script hooks into the update process of oh-my-zsh
# and also updates ~/.zsh as well as some other things
# like homebrew.
#
# To update manually, run:
#
#     zsh-update
#
function upgrade_oh_my_zsh () {
	source $ZSH_CUSTOM/tools/upgrade.sh
}
source $HOME/.zsh/tools/check_for_update.zsh


# ## Update hooks
#
# This plugin makes use of [zsh-hooks](https://github.com/willghatch/zsh-hooks)
# to allow other plugins to hook into the update process.
#
# When writing a plugin, hook the functions to execute when
# updating into the process, like this:
#
#     foo_plugin_update() {
#       # stuff executed by this plugin when
#       # the update process is run.
#     }
#
#     hooks-add-hook zsh_update foo_plugin_update
#
# Or, short:
#
#     hook zsh_update foo_plugin_update
#
# Or, shorter:
#
#     on_update foo_plugin_update
#
source "$ZSH_CUSTOM/plugins/auto-update/zsh-hooks.zsh"
hooks-define-hook zsh_update
alias hook='hooks-add-hook'
alias on_update='hook zsh_update'


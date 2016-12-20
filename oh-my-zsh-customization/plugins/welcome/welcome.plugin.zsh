# This plugins prints some useful information about the current machine
# when opening a new terminal.
#
# This is done using [screenfetch](https://github.com/KittyKatt/screenFetch).
# Install with `brew install screenfetch`.
#
# Next to the starfleet sign, of course :)
#
# I've taken this from mooos: https://github.com/idk/moo-skel

screenfetch_command() {
  if [ -f $HOME/screenfetch-moo ]; then
    # The patched version for my moo os machine.
    $HOME/screenfetch-moo $*
  elif [ -f /usr/local/bin/screenfetch ]; then
    # The one installed by homebrew.
    /usr/local/bin/screenfetch $*
  else
    # For external servers, the one from this repo.
    $ZSH_CUSTOM/plugins/welcome/screenfetch $*
  fi
}

screenfetch_logo() {
  if [[ $USER = 'ani' ]]; then
    echo "-a $ZSH_CUSTOM/plugins/welcome/flower.zsh"
  elif [ `hostname` = 'fiedl-mbp.local' ]; then
    echo "-a $ZSH_CUSTOM/plugins/welcome/starfleet-logo.zsh"
  elif [ `hostname` = 'fiedl-mbp' ]; then
    echo "-a $ZSH_CUSTOM/plugins/welcome/starfleet-logo.zsh"
  elif [ `hostname` = 'fiedl-mbp-2009' ]; then
    echo "-a $ZSH_CUSTOM/plugins/welcome/starfleet-logo.zsh"
  elif [ `hostname` = 'arch-mbp-2009' ]; then
    echo "-D mooOS"
  elif [ -d /var/wingolfsplattform ]; then
    echo "-a $ZSH_CUSTOM/plugins/welcome/wingolf-logo.zsh"
  fi
}

screenfetch_command `screenfetch_logo`

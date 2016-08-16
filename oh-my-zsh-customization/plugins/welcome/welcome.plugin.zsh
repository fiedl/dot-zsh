# This plugins prints some useful information about the current machine
# when opening a new terminal.
#
# This is done using [screenfetch](https://github.com/KittyKatt/screenFetch).
# Install with `brew install screenfetch`.
#
# Next to the starfleet sign, of course :)
#
# I've taken this from mooos: https://github.com/idk/moo-skel

if [ -f $HOME/screenfetch-moo ]
then
  $HOME/screenfetch-moo -D mooOS
elif [ -d /var/wingolfsplattform ]
then
  screenfetch -a $ZSH_CUSTOM/plugins/welcome/wingolf.zsh
else
  screenfetch -a $ZSH_CUSTOM/plugins/welcome/starfleet-logo.zsh
fi

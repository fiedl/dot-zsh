# This plugin provides shortcuts for installing software
# using homebrew cask.
#
#     search vlc
#     install vlc
#     uninstall vlc
#
# Or, in German (for parents :-) )
#
#     suche skype
#     installiere skype
#     deinstalliere skype
#
alias search='brew cask search'
alias install='brew cask install'
alias uninstall='brew cask uninstall'

alias suche='search'
alias installiere='install'
alias deinstalliere='uninstall'

install_plugin_update() {
  echo "updating the install plugin"
  [[ -f /usr/local/bin/brew ]] && brew tap caskroom/cask
}
hooks-add-hook zsh_update install_plugin_update

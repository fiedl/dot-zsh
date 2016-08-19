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

alias brew='[[ -f /usr/local/bin/brew ]] && brew'

update_install_plugin() {
  printf "updating the install plugin\n"
  [[ -f /usr/local/bin/brew ]] && brew tap caskroom/cask
}
on_update update_install_plugin

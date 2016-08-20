# ## Selective history
#
# To select a command from the history to repeat, type the beginning
# and press the up key.
#
#     ssh<up>
#     # =>  ssh mccoy
#
# See also: https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
#
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# ## Command highlighting
#
# When you type, the zsh checks whether the command in known. If so,
# it's highlighted.
#
# I've taken this from
# https://github.com/zsh-users/zsh-syntax-highlighting
# and got the idea from
# https://github.com/idk/moo-skel.
#
source "$ZSH_CUSTOM/plugins/highlight/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

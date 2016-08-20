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
bindkey -e
typeset -A key
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# ## Home and end keys
#
# This makes them also work in the terminal.
# I've taken this from http://zshwiki.org/home/zle/bindkeys.
#
bindkey "^[[H"  beginning-of-line                # ${terminfo[khome]}   key_Home
bindkey "^[[F"  end-of-line                      # ${terminfo[kend]}    key_End
bindkey "^[[A"  up-line-or-beginning-search      # ${terminfo[kcuu1]}   key_Up
bindkey "^[[B"  down-line-or-beginning-search    # ${terminfo[kcud1]}   key_Down
bindkey "^[[D"  backward-char                    # ${terminfo[kcub1]}   key_Left
bindkey "^[[C"  forward-char                     # ${terminfo[kcuf1]}   key_Right

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  # Finally, make sure the terminal is in application mode, when zle is
  # active. Only then are the values from $terminfo valid.
  function zle-line-init () {
    echoti smkx
  }
  function zle-line-finish () {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

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
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source "$ZSH_CUSTOM/plugins/highlight/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

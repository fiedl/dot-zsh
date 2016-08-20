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
#
# key[Home]=${terminfo[khome]}
# key[End]=${terminfo[kend]}
# key[Insert]=${terminfo[kich1]}
# key[Delete]=${terminfo[kdch1]}
# key[Up]=${terminfo[kcuu1]}
# key[Down]=${terminfo[kcud1]}
# key[Left]=${terminfo[kcub1]}
# key[Right]=${terminfo[kcuf1]}
# key[PageUp]=${terminfo[kpp]}
# key[PageDown]=${terminfo[knp]}
# [[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
# [[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
# [[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
# [[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
# [[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-beginning-search
# [[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-beginning-search
# [[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
# [[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

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

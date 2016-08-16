# fiedl's oh-my-zsh theme
# https://github.com/fiedl/dot-zsh
#
# Ideas taken from:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/tjkirch.zsh-theme
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

function user_name_prompt_color {
	if [ $UID -eq 0 ]; then echo "%{$fg_bold[red]%}"; else echo "%{$fg[magenta]%}"; fi
}

function ret_status {
  echo "%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
}

PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%}
)
%{$fg[green]%}[%*] %_$(user_name_prompt_color)%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)
$(ret_status) %{$reset_color%}'
RPROMPT=''

# PS1
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m(fiedl-mbp)%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)
#%_$(prompt_char) "

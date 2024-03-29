# fiedl's oh-my-zsh theme
# https://github.com/fiedl/dot-zsh
#
# Ideas taken from:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/tjkirch.zsh-theme
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme

local date_and_time='%{$fg[green]%}[%D{%Y-%m-%d %H:%M:%S}]'

if [[ $UID -eq 0 ]]; then
    local username='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
else
    local username='%{$terminfo[bold]$fg[magenta]%}%n%{$reset_color%}'
fi
local hostname='%{$fg[yellow]%}%m%{$reset_color%}'
local user_and_host="${username}@${hostname}"

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""
local git_branch='$(git_prompt_info)%{$reset_color%}'
local git_commit='$(git_prompt_short_sha)'

local prompt_symbol="%(?:▶:%{$fg[red]%}▶%s)"

PROMPT="
${date_and_time} ${user_and_host} ${current_dir} ${git_branch} ${git_commit}
${prompt_symbol} "

# # https://stackoverflow.com/a/17915194/2066546, https://gist.github.com/shvchk/f0d75441c067939a63815755c306d8d8
# # Unfortunately breaks arrow-up history.
#
# TMOUT=1
# 
# TRAPALRM() {
#     if ! [[ "$WIDGET" =~ ^(complete-word|fzf-completion|expand-or-complete|.*beginning-search)$ ]]; then
#         zle reset-prompt
#     fi
# }

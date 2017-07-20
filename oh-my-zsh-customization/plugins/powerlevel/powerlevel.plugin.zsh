# This plugin is for working with the powerlevel9k zsh theme.
# https://github.com/bhilburn/powerlevel9k
#
# ## Auto install
#
# If the directory `$ZSH_CUSTOM/themes/powerlevel9k`
# is missing, it is fetched from https://github.com/bhilburn/powerlevel9k.
#
[[ ! -d $ZSH_CUSTOM/themes/powerlevel9k ]] && git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
#
# If you want to use the theme, please specify it in your `~/.zshrc`.
#
#     # ~/.zshrc
#     # ...
#     ZSH_THEME="powerlevel9k/powerlevel9k"
#
# See also: https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions
#
# ## Configuration
#
# You may configure powerlevel9k in `~/.zshenv` using environment variables.
# But this plugin sets some nice defaults.
#
# See also: https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# And: https://gist.github.com/athityakumar/1bd5e9e24cd2a1891565573a893993eb
#
export TERM="xterm-256color"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context root_indicator ssh dir dir_writable rbenv rspec_stats vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "

POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%H:%M  \UF133  %d.%m.%y}"

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
#
export TERM="xterm-256color"
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

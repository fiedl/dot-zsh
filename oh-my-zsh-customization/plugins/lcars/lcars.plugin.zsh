# <img src="screenshots/Bildschirmfoto 2017-07-20 um 23.41.49.png" width="500">

# Experimental lcars features.
#
# ## lcars command
#
# Prefix any command with `lcars` if you like.
#

# ## Play sound
#
# Play random lcars sound from `~/Music/lcars`.
# This requires `brew install mplayer coreutils`.
#
#     lcars-sound
#

lcars-sound() {
  if [[ -z $(ps aux | grep mplayer | grep lcars | grep -v grep) ]]; then
    $ZSH_CUSTOM/plugins/lcars/bin/lcars-sound > /dev/null 2>&1
  fi
}

# ## Terminal lcars
#
# Display terminal head with system info in lcars style.
#
#     lcars-new
#
# This is executed when the plugin is included, i.e. don't use it
# together with the *welcoem* plugin.

function lcars-new() {
  clear
  # osascript -e 'tell application "System Events" to keystroke "k" using command down'
  $ZSH_CUSTOM/plugins/lcars/bin/lcars-frame head
  lcars-sound
}

lcars-new

function lcars() {
  lcars-sound
}

function lcars-start() {
  lcars-sound
}

function lcars-end() {
  echo ""
  $ZSH_CUSTOM/plugins/lcars/bin/lcars-frame prompt
  lcars-sound
}

export TERM="xterm-256color"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_STATUS_BACKGROUND='yellow'
POWERLEVEL9K_TIME_BACKGROUND='magenta'
POWERLEVEL9K_TIME_FOREGROUND='black'

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="▇▇▇▇▇▇▇▇▇▇▇\n▇▇▇▇▇▇▇▇▇▇▇    "
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="▇▇▇▇▇▇▇▇▇▇▇    ➜ "

# ◖ button ◗
# export POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='◗ ◖'
# export POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='◗ ◖'
# export POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR='◗ ◖'
# export POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='◗ ◖'
# export POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='◗ ◖'

# Wrap each command within lcars sound and tab-color change
lcars_run_before_each_command() { tab-blue; lcars-sound }
lcars_run_after_each_command() { tab-reset; lcars-sound }
add-zsh-hook preexec lcars_run_before_each_command
add-zsh-hook precmd lcars_run_after_each_command


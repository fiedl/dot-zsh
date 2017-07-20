# Experimental lcars features.
#
# ## Play sound
#
# Play random lcars sound from `~/Music/lcars`.
# This requires `brew install mplayer coreutils`.
#
#     lcars-sound
#

lcars-sound() { $ZSH_CUSTOM/plugins/lcars/bin/lcars-sound > /dev/null 2>&1 }

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
  $ZSH_CUSTOM/plugins/lcars/bin/lcars-frame
  lcars-sound
}

lcars-new

# Wrap a command in an lcars frame.
# 
#     lcars echo foo
#

function lcars() {
  lcars-sound
  $ZSH_CUSTOM/plugins/lcars/bin/lcars-frame start $*
  echo ""
  $*
  echo ""
  $ZSH_CUSTOM/plugins/lcars/bin/lcars-frame end
}
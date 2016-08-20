# ## Remap keys (macOS)
#
# Using karabiner I have remapped my keyboard.
#
# Karabiner provides a command-line interface to activate
# or deactivate settings:
#
#     karabiner set karabiner set remap.optionR2forwarddelete 1
#     karabiner set karabiner set remap.optionR2forwarddelete 0
#
# Also, this script provides a short comamnd to create and apply
# new key remappings.
#
# They keycodes can be looked up here:
# https://github.com/tekezo/Karabiner/blob/master/src/bridge/generator/keycode/data/KeyCode.data
#
# But be aware, they always refer to the us keyboard layout.
#
#     create-key-map slash backslash
#     create-key-map "slash shift" backslash
#
# The new mapping is appended to
# ~/Library/Application Support/Karabiner/private.xml
#
# To edit this file, just type:
#
#     key-maps
#
alias -g create-key-map="ruby $ZSH_CUSTOM/plugins/keyboard/karabiner_map_key_to_key.rb"
alias -g key-maps="e $HOME/Library/Application\ Support/Karabiner/private.xml"
alias -g karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'

if [ -d /Applications ]; then

  update_keyboard_plugin() {
    printf "updating the keyboard plugin\n"

    install karabiner

    cd $ZSH_CUSTOM/plugins/keyboard
    gem install bundler
    bundle install

    karabiner set remap.dashboard2f4 1
    karabiner set remap.optionR2forwarddelete 1
    karabiner set remap.toggle_bluetooth_by_fn_b 1
    karabiner set remap.toggle_wifi_by_fn_w 1
    karabiner set repeat.initial_wait 400
    karabiner set repeat.wait 23

    create-key-map launchpad f4
    create-key-map shift_r f18
  }
  on_update update_keyboard_plugin

fi
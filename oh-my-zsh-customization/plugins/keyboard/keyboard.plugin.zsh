# ## Remap keys (macOS)
#
# Using karabiner I have remapped my keyboard.
#
#     p ü + ö ä # < -   (layout: de)
#     ----------------------------------
#     \ { }   [ ] |     Alt_L
#     \ { }   [ ] | ~   Cmd_R
#       [ ]             Alt_L + Shift_L
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
# ~/Library/Application Support/Karabiner/private.xml.
#
# Manual: https://pqrs.org/osx/karabiner/xml.html.en
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

    # More special combinations, i.e. with more modifiers, have to come first!
    # https://pqrs.org/osx/karabiner/xml.html.en#order

    # alt + p -> \
    create-key-map "p alt" "7 shift alt"
    create-key-map "p, ModifierFlag::COMMAND_R" "7 shift alt"

    # alt+shift+ü -> [
    create-key-map "bracket_left shift alt" "5 alt"

    # alt+shift++ -> ]
    create-key-map "bracket_right shift alt" "6 alt"

    # alt+ü -> {
    create-key-map "bracket_left alt" "8 alt"
    create-key-map "bracket_left, ModifierFlag::COMMAND_R" "8 alt"

    # alt++ -> }
    create-key-map "bracket_right alt" "9 alt"
    create-key-map "bracket_right, ModifierFlag::COMMAND_R" "9 alt"

    # alt+< -> |
    create-key-map "backquote alt" "7 alt"

    # alt+ä -> [
    create-key-map "quote alt" "5 alt"
    create-key-map "quote, ModifierFlag::COMMAND_R" "5 alt"

    # alt+# -> ]
    create-key-map "backslash alt" "6 alt"
    create-key-map "backslash, ModifierFlag::COMMAND_R" "6 alt"

    # cmd_r+- -> ~
    create-key-map "slash, ModifierFlag::COMMAND_R" "n alt"
  }
  on_update update_keyboard_plugin

fi
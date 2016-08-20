if [ -f /Applications/Karabiner.app/Contents/Library/bin/karabiner ]; then
  alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
fi

update_keyboard_plugin() {
  printf "updating the keyboard plugin\n"

  if [ -d /Applications ]; then
    install karabiner
    alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'

    karabiner set private.change_launchpad_to_f4 1
    karabiner set private.change_shift_r_to_f18 1
    karabiner set remap.dashboard2f4 1
    karabiner set remap.optionR2forwarddelete 1
    karabiner set remap.toggle_bluetooth_by_fn_b 1
    karabiner set remap.toggle_wifi_by_fn_w 1
    karabiner set repeat.initial_wait 400
    karabiner set repeat.wait 23
  fi
}
on_update update_keyboard_plugin

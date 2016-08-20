# Quickly start a text editor:
#
#     e
#     e .
#     e ~/.zshrc
#
# If textmate (`mate`) is installed, it will be used as editor.
# Otherwise, `emacs -nw` (in the terminal, not as window).
# Otherwise, `vim`.
#
[[ -f `which vim` ]] && alias e='vim'
[[ -f `which emacs` ]] && alias e='emacs -nw'
[[ -f /usr/bin/atom ]] && alias e='atom'
[[ -f `which mate` ]] && alias e='mate'
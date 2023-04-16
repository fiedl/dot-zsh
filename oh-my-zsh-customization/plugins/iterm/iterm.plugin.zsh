# https://gist.github.com/wadey/1140259/e3a14d2fcecdebdc67fe193a9bd0264d8bec45a0

tab-color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
  echo -ne "\033]6;1;bg;*;default\a"
  trap - INT EXIT
}

tab-blue() { tab-color 0 0 255 }

#color-ssh() {
#  if [[ -n "$ITERM_SESSION_ID" ]]; then
#    trap "tab-reset" INT EXIT
#    if [[ "$*" =~ "k154dckr030|production" ]]; then
#      tab-color 255 0 0
#    elif [[ "$*" =~ "10.10.11.58|staging" ]]; then
#      tab-color 255 255 0
#    elif [[ "$*" =~ "k154dckr030" ]]; then
#      tab-color 255 0 0
#    else
#      tab-color 0 255 0
#    fi
#  fi
#  /usr/bin/ssh $*
#}
#compdef _ssh color-ssh=ssh
#
#unalias ssh
#alias ssh="color-ssh"
#
# RAKE=$(which rake)
#
# color-bundle() {
#   if [[ -n "$ITERM_SESSION_ID" ]]; then
#       trap "tab-reset" INT EXIT
#       if [[ "$*" =~ "rails s|guard" ]]; then
#           tab-color 255 0 0
#       else
#           tab-color 0 0 255
#       fi
#   fi
#   /usr/local/bin/bundle $*
# }
# compdef _bundle color-bundle=bundle
#
# alias bundle=color-bundle
#
#
# color-rake() {
#   if [[ -n "$ITERM_SESSION_ID" ]]; then
#       trap "tab-reset" INT EXIT
#       if [[ "$*" =~ "deploy" ]]; then
#           tab-color 255 0 0
#       else
#           tab-color 0 0 255
#       fi
#   fi
#   $RAKE $*
# }
# compdef _rake color-rake=rake
#
# alias rake=color-rake
#
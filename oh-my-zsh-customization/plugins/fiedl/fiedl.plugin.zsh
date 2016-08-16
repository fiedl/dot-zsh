# ## Updating the zsh configuration
#
# These commands help to sync the zsh configuration up and down.
# Through the oh-my-zsh auto update process, the repo is down-synced
# automatically. This is prevented by uncommited changes in ~/.zsh.
#
# Quickly commit and push local changes:
#
#     zsh-push
#
# Get latest changes by running one of these:
#
#     zsh-pull
#     zsh-update

zsh-push() {
  cd ~/.zsh
  zsh-update-documentation
  git commit --all --message="Updating zsh configuration at $(date)."
  git push origin master
}
zsh-pull() { upgrade_oh_my_zsh } # which also updates ~/.zsh
zsh-update() { zsh-pull }
zsh-update-documentation() {
  ruby $ZSH_CUSTOM/plugins/fiedl/bin/update_documentation.rb
}


# ## Code grepping
#
# These helpers are useful to find definitions in code or quickly grep for
# expressions.
#
#     def current_user
#     g class User

gre() { grep --recursive --regexp="$@" --exclude-dir=log --exclude-dir=coverage --exclude-dir=neo4j --exclude-dir=tmp --exclude-dir=.git . ; }

unalias g
function g () { tput rmam; grep --exclude-dir log --exclude-dir tmp --exclude-dir .yardoc --exclude-dir doc --exclude-dir coverage --recursive --line-number "$*" . ; tput smam }  # --ignore-case
function def () { g "def $*"; g "def self.$*" }


# ## Finding files
#
# Quickly find a file within the current directory.
#
#     f user
#     f user |count
#
# This uses friendly find (ffind), which needs to be installed.
# Mac: `brew install ffind`.

alias f='ffind'
alias count='wc -l'


# ## Moving files
#
# Move multiple files with wildcards using multimove.
#
#     mmv foo-*.txt foo/*.md
#
# See also:
# http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/

autoload -U zmv
alias mmv='noglob zmv -W'


# ## Fun stuff
#
# Play random lcars sound from ~/Music/lcars.
# Requires `brew install mplayer coreutils`.
#
#    lcars
#
# Display the matrix.
# Requires `brew install cmatrix`.
#
#    matrix

lcars() { $ZSH_CUSTOM/plugins/fiedl/bin/lcars > /dev/null 2>&1 }
alias matrix='cmatrix -C magenta'


# ## Killing processes
#
#     ka vlc

alias ka='pkill -f'


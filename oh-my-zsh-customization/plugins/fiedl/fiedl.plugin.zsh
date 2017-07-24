# ## Passing sudo
#
# Aliases also work with sudo.
# This trick is from https://wiki.archlinux.org/index.php/Sudo#Passing_aliases.
#
# Why? From the alias section in the bash manpage (http://serverfault.com/a/178956/167331):
#
# > A trailing space in value causes the next word to be checked
# > for alias substitution when the alias is expanded.
#
alias sudo='sudo '

# ## Code grepping
#
# These helpers are useful to find definitions in code or quickly grep for
# expressions.
#
#     def current_user
#     g class User

gre() { grep --recursive --regexp="$@" --exclude-dir=log --exclude-dir=coverage --exclude-dir=neo4j --exclude-dir=tmp --exclude-dir=.git . ; }

unalias g
function g () { tput rmam; grep --exclude-dir log --exclude-dir tmp --exclude-dir .yardoc --exclude-dir doc --exclude-dir coverage --exclude-dir vendor --exclude-dir node_modules --recursive --line-number "$*" . ; tput smam }  # --ignore-case
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


# ## Finding files on the NAS
#
# Find files on the NAS by:
#
#     nas-find Keith Jarrett
#     nf Keith Jarrett
#
# My NAS has a cron job to create a file index at `/share/Sebastian/.find.txt`.
# In the work machine's file system, this is `/Volumes/Sebastian/.find.txt`.
# The above commands just grep in that file.
#
#     # crontab -e
#     0 2 * * * cd /share/Sebastian; /usr/bin/find ./ |sed -e 's/\.\//\/Volumes\/Sebastian\//g' > .find.tmp; /bin/rm .find.txt; /bin/mv .find.tmp .find.txt
#

function nas-find () { grep --ignore-case "$*" /Volumes/Sebastian/.find.txt }
alias nf='nas-find'


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
# Display the matrix.
# This requires `brew install cmatrix`.
#
#     matrix

alias matrix='cmatrix -C magenta'


# ## Killing processes
#
#     ka vlc

alias ka='pkill -f'


# ## Shortcut for controlling services through homebrew.
#
#     service restart elasticsearch
#
# Will be the same as:
#
#     brew services restart elasticsearch

alias service='brew services'
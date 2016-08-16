# I have taken this excellent zsh configuration from mooOS, the gnu/linux
# distro of shape shifting, time travelling alien space penguins, https://mooos.org.
#
# The source can be found here: https://github.com/idk/moo-skel
#

HISTFILE=~/.histfile_`hostname`
HISTSIZE=10000
SAVEHIST=10000
HISTFILESIZE=${HISTSIZE} ## bash will remember N commands
HISTCONTROL=ignoreboth   ## ingore duplicates and spaces (ignoreboth, ignoredups, ignorespace)
REPORTTIME=10 # print elapsed time when more than 10 seconds

## don't append the following to history: consecutive duplicate
## commands, ls, bg and fg, and exit
HISTIGNORE='\&:fg:bg:ls:pwd:cd ..:cd ~-:cd -:cd:jobs:set -x:ls -l:ls -l'
HISTIGNORE=${HISTIGNORE}':%1:%2:shutdown*'
export HISTIGNORE
export PATH="/usr/lib/cw:$PATH"
export NMON=rkj
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local}
export MOZ_DISABLE_PANGO=1
#export LD_LIBRARY_PATH="/opt/desura/lib:$LD_LIBRARY_PATH"

## if !/bin exists, add ~/bin to PATH
if [ -d ~/bin ] ; then
   PATH=~/bin:$PATH
fi

if [ -d ~/.gem/ruby/1.9.1/bin ] ; then
   PATH=~/.gem/ruby/1.9.1/bin:$PATH
fi

## clipbored options for dmenurl/dmenuclip
#export CLIPBORED_DMENU_FONT=terminus
#export CLIPBORED_DMENU_NORMAL_FG=#4FFF64

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

bindkey -e

## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
## match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 1. All /etc/hosts hostnames are in autocomplete
if [ -f $HOME/.ssh/known_hosts ] ; then
    hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})
    zstyle ':completion:*:hosts' hosts $hosts
fi

## ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt http ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort

setopt completealiases
setopt completeinword
setopt autocd
setopt interactivecomments # pound sign in interactive prompt
setopt share_history

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

## edit inline
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

#autoload -U colors && colors
## create a zkbd compatible hash;
## to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

## setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-beginning-search
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-beginning-search
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.

function zle-line-init () {
    if (( ${+terminfo[smkx]} )); then
        echoti smkx
    fi
}

function zle-line-finish () {
    if (( ${+terminfo[rmkx]} )); then
        echoti rmkx
    fi
}

zle -N zle-line-init
zle -N zle-line-finish

watch=all
LOGCHECK=60
## End of lines added by compinstall
## This will set the default prompt to the walters theme
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

prompt_char(){
    [[ -n $vcs_info_msg_0_ ]] && echo '╘═😸 ' && return
    echo '└─╼ '
}

vi-git-status () {
  ## Untracked files.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]='%F{r}?%f'
  fi
}

prompt_gtmanfred_precmd(){
    vcs_info
}

prompt_gtmanfred_help(){
  cat <<EOH
gtmanfred's prompt
EOH
}

prompt_gtmanfred_setup() {
    setopt prompt_subst
    autoload -U colors && colors
    autoload -Uz add-zsh-hook vcs_info

    prompt_opts=(cr percent subst)
    add-zsh-hook precmd prompt_gtmanfred_precmd

    zstyle ':vcs_info:*' enable bzr git hg svn
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '%F{g}●%f'
    zstyle ':vcs_info:*' unstagedstr '%F{y}!%f'
    zstyle ':vcs_info:*' formats 'on %F{m}%b%c%u%F{n}'
    zstyle ':vcs_info:*' actionformats "%b%c%u|%F{c}%a%f"
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b|%F{c}%r%f'
    zstyle ':vcs_info:git*+set-message:*' hooks git-status

    PROMPT='┌─ %B%F{blue}%n%f%b %F{red}at%f %B%F{blue}%m%f%b %F{red}in%f %B%F{blue}%~%f%b ${vcs_info_msg_0_}%{$reset_color%}$prompt_newline$(prompt_char)%f'

    RPROMPT="%(?,%F{blue}(⌐■_■),%F{red}%? %F{red}(ﾉ °益°)ﾉ 彡 ┻━┻)%f"
    PS4='+%N:%i:%x:%I>'
}

prompt_gtmanfred_preview(){
    prompt_preview_theme gtmanfred "$@"
}
prompt_gtmanfred_setup "$@"

## Window title
case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd () { print -Pn "\e]0;[%n@%M][%~]%#\a" }
		preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
	;;
    screen)
    	precmd () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
		}
		preexec () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
		}
	;;
esac

## hub tab-completion script for zsh.
## This script complements the completion script that ships with git.

## Autoload _git completion functions
if declare -f _git > /dev/null; then
  _git
fi

if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  ## Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/base_commands=(/base_commands=(${_hub_commands} /')"
fi

set -o notify

## information
screenfetch -D "mooOS"

## force decrypt shell history
decrypt_hist() {
    gpg ${HISTFILE}.gpg
}

## force encrypt shell history
encrypt_hist() {
    gpg -c $HISTFILE
    rm $HISTFILE
}

## usage: remind <time> <text>
## e.g.: remind 10m "omg, the pizza"
remind() {
    sleep $1 && notify-send "$2" &
}

## usage: human_filesize <size in bytes>
human_filesize() {
  awk -v sum="$1" ' BEGIN {hum[1024^3]="Gb"; hum[1024^2]="Mb"; hum[1024]="Kb"; for (x=1024^3; x>=1024; x/=1024) { if (sum>=x) { printf "%.2f %s\n",sum/x,hum[x]; break; } } if (sum<1024) print "1kb"; } '
}

## usage: remind <time> <text>
## e.g.: remind 10m "omg, the pizza"
sp() {
  gg="https://startpage.com/do/search?q="
  ff="$BROWSER"
  term="$1"
  if [ $1 ]; then
    "$ff" -new-tab "$gg"$(echo ${1//[^a-zA-Z0-9]/+})
  else
    echo 'Usage: sp (startpage) "[seach term]"'
  fi
}

## usage: logjack <application>
## e.g.: logjack iceweasel
logjack() {
   APP="$(pidof $1)"
   strace -ff -e trace=write -e write=1,2 -p $APP
}

## usage: cdl <directory>
## result: it will automatically execute the command 'ls -al' after cd
cdl() {
   cd "$@";
   ls -al;
}

mcd () {
    mkdir -vp "$1";
    cd "$1"
}

## Services shortcuts and commonlyh used functions
_listd() {
    [[ -d /etc/systemd/system/multi-user.target.wants ]] && ls -l /etc/systemd/system/multi-user.target.wants
    [[ -d /etc/systemd/system/default.target.wants ]] && ls -l /etc/systemd/system/default.target.wants
    [[ -d /etc/systemd/system/remote-fs.target.wants ]] && ls -l /etc/systemd/system/remote-fs.target.wants
}

_start() {
    sudo systemctl start $1.service
    sudo systemctl status $1.service
}

_restart() {
    sudo systemctl restart $1.service
    sudo systemctl status $1.service
}

_stop() {
    sudo systemctl stop $1.service
    sudo systemctl status $1.service
}

_status() {
    sudo systemctl status $1.service
}

_enable() {
    sudo systemctl enable $1.service
    _listd
}

_disable() {
    sudo systemctl disable $1.service
    _listd
}

pac() {
    pacaur -S "$@"
    schroot -p -- pacaur -S "$@"
}

pacrs() {
    sudo pacman -Rs "$@"
    schroot -p -- sudo pacman -Rs "$@"
}

cmdhr() {
  cd ~/Desktop
  history $1 > cmdhr.txt
  cat cmdhr.txt
  cd -
}

## Grabs the disk usage in the current directory
alias usage='du -ch 2> /dev/null | tail -1'

## Gives you what is using the most space, both directories and files
alias most='du -hsx * | sort -rh | head -10'

## usage: pxclip
## result: pastes code from clipboard and fills clipboard with URL of paste
alias pxclip='torsocks wgetpaste --service gists --language Shell  --xcut --xclippaste'
## usage: cat <file> | pfile
## e.g.: cat ~/.zshrc | pfile
alias pfile='torsocks wgetpaste --service gists --language Shell --xclippaste'
alias google='goo'
alias googleimages='gi'
alias startpage='sp'
alias sudo='sudo '
alias _='sudo'
alias c='clear'
alias f='file'
alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias ping='ping -c 5'
alias pong='torsocks ping -c 5'
## safety features
alias cp='cp'
alias mv='mv -i'
alias rm='rm -I'    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
## Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
alias .p="pushd ."
alias p.="popd"
## fun stuffs
alias matrix='cmatrix -C magenta'
## Youtube Viewer
alias yt='youtube-dl'
alias ytn='youtube-dl --ignore-config --no-mtime --prefer-free-formats -c'
## useful stuffs
# Show history
alias history='fc -l 1'
alias ..='cd ..'
## tor/socks5 stuffs
alias ssh='export TERM=xterm-color && ssh'
alias sshtor='export TERM=xterm-color ; torsocks ssh'
alias resolve='tor-resolve'
#alias dbu='usewithtor dropbox_uploader'
alias wgettor='usewithtor wget'
alias curltor='usewithtor curl'
# misc
alias grep='grep --color=auto'
alias delthumbs='rm -rv ~/.thumbnails/ && rm ~/.kde4/cache-$HOST/icon-cache.kcache'
alias reload='source ~/.zshrc'
alias xreload='xrdb ~/.Xdefaults'
alias delfonts='fc-cache -vf'
alias cclean='sudo pkgcacheclean -v'
alias exitclean='disown -a && exit'
alias sy='systemctl'
alias md5='md5sum'
alias killdoll="sudo killall -9 knotify4;sudo killall -9 kuiserver;sudo killall -9 kglobalaccel;sudo killall -9 kded4;sudo killall -9 kdeinit4:;sudo killall -9 kactivitymanagerd;sudo killall -9 kio_http_cache_; sudo killall -9 kactivitymanagerd; sudo killall -9 kdeinit4; sudo killall -9 kded4; sudo killall -9 knotify4; sudo killall -9 kuiserver; sudo killall -9 kglobalaccel; sudo killall -9 klauncher; sudo killall -9 dolphin; echo 'all kde stuffs killed...'"
## usage: checkvid <video file>
alias checkvid='mplayer -vo null -ao null -identify -frames 0'
## usage: 2thumb <image file>
alias 2thumb='convert -resize 250x250'
alias addclock='while sleep 1;DATE=$(date);do tput sc;tput cup 0 $(($(tput cols)-${#DATE}));printf "$DATE";tput rc;done &'
alias nocomment='grep -Ev '\''^(#|$)'\'''
#progress bar on file copy. Useful evenlocal.
alias cpr="rsync --progress -ravz"
alias tag="tmsu tag"
alias untag="tmsu untag"
alias tags="tmsu tags"
alias mtag="tmsu tag --tags"
# control hardware
#alias cdo='eject /dev/cdrecorder'
#alias cdc='eject -t /dev/cdrecorder'
#alias dvdo='eject /dev/dvd'
#alias dvdc='eject -t /dev/dvd'
# more custom commands
alias psg='ps aux | grep'  #requires an argument
alias cpufreq='watch grep \"cpu MHz\" /proc/cpuinfo'
alias nets='ls /sys/class/net'
alias topnet='lsof -P -i -n'
## usage: <command> | 2png
alias 2png='convert label:@- cmd.png'
## usage: 2mp3 <output-file> <input-file>
alias 2mp3='mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile'
## chmod commands
#alias mx='chmod a+x'
#alias 000='chmod 000'
#alias 644='chmod 644'
#alias 755='chmod 755'
alias driversinuse="lspci -nnk | grep -i vga -A3"
alias sip='sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n'

## pacman
alias p="sudo pacman -Syu"       # install one or more packages
alias pp="pacman -Ss"            # search for a package using one or more keywords
alias qs="pacman -Qs"            # search for installed package using one or more keywords
alias syu="sudo pacman -Syu"     # upgrade all packages to their newest version
alias rr="sudo pacman -R"        # uninstall one or more packages
alias rs="sudo pacman -Rs"       # uninstall one or more packages and its dependencies
## powerpill
#alias pillu="sudo powerpill -Syu"
#alias pill="sudo powerpill -S"
alias a="pacaur -Syu"             # install packages
alias aa="pacaur -s"              # search package
alias syua="pacaur -Syua"         # update aur packages
alias syud="pacaur -Syua --devel" # update devel packages
#alias pac="sudo pacman -Syu && pacaur -Syua"
alias cow="cower -u -v"
#alias update='sudo powerpill -Syu && cower -u -v'
alias plocal='pacman -Qqm | grep -vx "$(cat $HOME/bin/backup_exclude_pkgs)" > $HOME/github/pdq/local.lst && echo $(tr -s "\n" " " < $HOME/github/pdq/local.lst)'
alias pmain='pacman -Qqe | grep -vx "$(pacman -Qqg base)" | grep -vx "$(pacman -Qqm)" | grep -vx "$(<$HOME/bin/backup_exclude_pkgs)" > $HOME/github/pdq/main.lst && echo $(tr -s "\n" " " < $HOME/github/pdq/main.lst)'
alias zz="schroot -p -- pacaur -s"               # chroot search packages
alias z="schroot -p -- pacaur -Syu"               # chroot search packages
alias x="schroot -p -- sudo pacman -Ss"         # chroot search packages
alias zrs="schroot -p -- sudo pacman -Rs"       # chroot search packages
alias zzz="schroot -p --"                       # chroot
alias zqs="schroot -p -- pacman -Qs"       # search for installed package using one or more keywords

## git hub
alias git=hub
alias commit="git commit -m"
alias push="git push origin master"
## typos
alias exiy='exit'
alias rload='reload'
## systemd services
#alias steam='export STEAM_RUNTIME=0 && export SDL_AUDIODRIVER=alsa && steam'
## suffix aliases
alias -s php=subl3
alias -s html=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s GIF=feh
alias -s JPG=feh
alias -s PNG=feh
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR
hash -d github=$HOME/github
#hash -d units=/usr/lib/systemd/system/
## global aliases
alias -g ...='../..'
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g G='| egrep'
alias -g H='| head'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g S='| sort'
alias -g T='tail -f'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh



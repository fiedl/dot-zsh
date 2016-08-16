# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

printf "${BLUE}🚀\ Updating https://github.com/robbyrussell/oh-my-zsh ... \n${NORMAL}"
cd "$ZSH"
if git pull --rebase --stat origin master
then
  printf "${GREEN}done.${NORMAL}\n"
else
  printf "${RED}FAILED.${NORMAL}\n"
fi

printf "${BLUE}\n🚀\ Updating https://github.com/fiedl/dot-zsh ... ${NORMAL}"
cd ~/.zsh
if git diff-index --quiet HEAD --
then
  # no local changes. ready to update.
  if git pull origin master
  then
    printf "${GREEN}done.${NORMAL}\n"
  else
    printf "${RED}\nFAILED: Could not get changes from github repo.${NORMAL}\n"
  fi
else
  printf "${RED}\nFAILED: There are local changes. Please commit those first: ~/.zsh${NORMAL}\n"
  cd ~/.zsh
  git status
fi



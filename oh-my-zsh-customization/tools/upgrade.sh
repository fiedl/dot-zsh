printf "Updating https://github.com/robbyrussell/oh-my-zsh ... "
cd "$ZSH"
if git pull --rebase --stat origin master
then
  printf "done."
else
  printf "FAILED."
fi

printf "Updating https://github.com/fiedl/dot-zsh ... "
cd ~/.zsh
if git diff-index --quiet HEAD --
then
  # no local changes. ready to update.
  if git pull origin master
  then
    printf "done."
  else
    printf "FAILED: Could not get changes from github repo."
  fi
else
  printf "FAILED: There are local changes. Please commit those first."
fi



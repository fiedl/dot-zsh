# ## Shared libraries
#
# This repository contains some shared libraries and extensions
# I use in my latex projects.
#
# They can be symlinked or hardlinked into existing projects:
#
#     cd /path/to/my/latex/project
#     ln -s ~/.zsh/oh-my-zsh-customization/plugins/latex/lib lib
#     hln ~/.zsh/oh-my-zsh-customization/plugins/latex/lib lib
#
# Or, with this extension, short:
#
#     cd /path/to/my/latex/project
#     latex-link-lib
#     latex-unlink-lib
#
# When hardlinked, the lib directory is included in git's source control.
#
# The `hln` command is defined in https://github.com/selkhateeb/hardlink
# and can be installed on mac os using `brew install hardlink-osx`.
#
# Then the shread libraries can be included into the tex document:
#
#     % /path/to/my/latex/project/main.tex
#     % ...
#     % \input{lib/todo}
#
alias latex-link-lib="hln $ZSH_CUSTOM/plugins/latex/lib lib"
alias latex-unlink-lib="hln -u lib"


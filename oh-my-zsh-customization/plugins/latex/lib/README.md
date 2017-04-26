# latex/lib

This folder contains some shared libraries and extensions for latex.

It's part of this dotfiles repo:
https://github.com/fiedl/dot-zsh

The folder may be hardlinked. The source is at:
`~/.zsh/oh-my-zsh-customization/plugins/latex/lib`

### Hardlinks

The directory can be shared amongst projects by hardlinking it
using `hln`: https://github.com/selkhateeb/hardlink

```bash
# install hln on mac os
brew install hln

# create a link
cd /my/latex/project
hln ~/.zsh/oh-my-zsh-customization/plugins/latex/lib lib

# remove a link
cd /my/latex/project
hln -u destination
```
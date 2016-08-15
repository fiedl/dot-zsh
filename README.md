# .zsh

zsh-Konfiguration mit oh-my-zsh-Plugin "fiedl-zsh"

```
# Clone repo
git clone git@github.com:fiedl/dot-zsh ~/.zsh

# apply oh-my-zsh overrides
echo 'export ZSH_CUSTOM="$HOME/.zsh/oh-my-zsh-customization"' >> ~/.zshenv

# select oh-my-zsh plugins
echo 'export ZSH_PLUGINS="git bundler fiedl"' >> ~/.zshenv
```

### Updating

* The update is done regularly via oh-my-zsh.
* Run: `upgrade_oh_my_zsh`
* Or manually: `cd $HOME/.zsh; git pull`
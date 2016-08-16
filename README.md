# .zsh

My zsh configuration. I'm using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and place some overrides in `~/.zsh`.

### Installation

```bash
# Clone repo
git clone git@github.com:fiedl/dot-zsh ~/.zsh
```

This set of scripts won't touch your `~/.zshrc`.
Thus, add manually to your `~/.zshrc` what you'd like:

```bash
# ~/.zshrc

# Use https://github.com/fiedl/dot-zsh as override
# for oh-my-zsh:
ZSH_CUSTOM="$HOME/.zsh/oh-my-zsh-customization"

# Shell theme:
ZSH_THEME="fiedl"

# Activate auto update. This will fetch oh-my-zsh as
# well as updates from https://github.com/fiedl/dot-zsh.
export UPDATE_ZSH_DAYS=1

# choose oh-my-zsh plugins
plugins=(git bundler fiedl icecube plattform)
```

Then, start a new terminal. Done!

### Update

* The update is done regularly via oh-my-zsh.
* Or, run: `upgrade_oh_my_zsh`
* Or, run it manually: `cd $HOME/.zsh; git pull`

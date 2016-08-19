# .zsh

My zsh configuration. I'm using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and place some overrides in `~/.zsh`.

<img src="screenshots/Bildschirmfoto 2016-08-17 um 01.36.58.png" width="500">

## Installation

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
ZSH="$HOME/.oh-my-zsh"

# Shell theme:
ZSH_THEME="fiedl"

# Auto-install ~/.oh-my-zsh if missing.
if [ ! -d $ZSH ]; then
  curl -L http://install.ohmyz.sh | sh
fi

# Auto-install ~/.zsh if missing.
if [ ! -d ~/.zsh ]; then
  git clone git@github.com:fiedl/dot-zsh.git ~/.zsh
fi

# Auto-updating ~/.oh-my-zsh as well as ~/.zsh
# requires to use another upgrade script.
# Therefore, deactivate the oh-my-zsh-only one:
export DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="false"
export UPDATE_ZSH_DAYS=1
source $HOME/.zsh/tools/check_for_update.zsh

# choose oh-my-zsh plugins
plugins=(git bundler fiedl install icecube plattform welcome)
```

Then, start a new terminal. Done!

## Update

* When starting a terminal, oh-my-zsh will ask you to perform an upgrade, regularly. This will also update `~/.zsh`.
* Or, run: `zsh-update`.
* Or, pull changes manually: `cd $HOME/.zsh; git pull`

## Documentation

### [fiedl.plugin.zsh](oh-my-zsh-customization/plugins/fiedl/fiedl.plugin.zsh)


#### Editors

Quickly start a text editor:

    e
    e .
    e ~/.zshrc

If textmate (`mate`) is installed, it will be used as editor.
Otherwise, `emacs -nw` (in the terminal, not as window).
Otherwise, `vim`.


#### Updating the zsh configuration

These commands help to sync the zsh configuration up and down.
Through the oh-my-zsh auto update process, the repo is down-synced
automatically. This is prevented by uncommited changes in ~/.zsh.

Quickly commit and push local changes:

    zsh-push

If needed, with commit message:

    zsh-push -m "I added cool stuff ..."

Get latest changes by running one of these:

    zsh-pull
    zsh-update

`zsh-push` will update the documentation in the README automatically.
But it may be run manually, e.g. before committing manually.

    zsh-update-documentation

To edit the plugin "welcome", just type:

    zsh-plugin welcome
    plugin welcome


#### Code grepping

These helpers are useful to find definitions in code or quickly grep for
expressions.

    def current_user
    g class User

#### Finding files

Quickly find a file within the current directory.

    f user
    f user |count

This uses friendly find (ffind), which needs to be installed.
Mac: `brew install ffind`.

#### Moving files

Move multiple files with wildcards using multimove.

    mmv foo-*.txt foo/*.md

See also:
http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/

#### Fun stuff

Play random lcars sound from `~/Music/lcars`.
This requires `brew install mplayer coreutils`.

    lcars

Display the matrix.
This requires `brew install cmatrix`.

    matrix

#### Killing processes

    ka vlc


### [icecube.plugin.zsh](oh-my-zsh-customization/plugins/icecube/icecube.plugin.zsh)

On the icecube machine in zeuthen, there's I3_PORTS installed.
Make some shortcuts:

    ice-port
    ice-cmake
    clsim-make
    icesim      # runs the env-shell



### [install.plugin.zsh](oh-my-zsh-customization/plugins/install/install.plugin.zsh)

This plugin provides shortcuts for installing software
using homebrew cask.

    search vlc
    install vlc
    uninstall vlc

Or, in German (for parents :-) )

    suche skype
    installiere skype
    deinstalliere skype



### [moo.plugin.zsh](oh-my-zsh-customization/plugins/moo/moo.plugin.zsh)

I have taken this excellent zsh configuration from mooOS, the gnu/linux
distro of shape shifting, time travelling alien space penguins, https://mooos.org.

The source can be found here: https://github.com/idk/moo-skel

https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
Show history
misc
control hardware
more custom commands


### [plattform.plugin.zsh](oh-my-zsh-customization/plugins/plattform/plattform.plugin.zsh)

These are some helpers for [Rails](https://github.com/rails/rails)
and [YourPlatform](https://github.com/fiedl/your_platform).

#### Directories

Here are some aliases to jump to directories.
On the development machine, the projects are expected to be in
`~/rails`, on the production machine, in `/var`.

    cdw  # wingolfsplattform
    cdy  # your_platform
    cdo  # your_platform_ops
    cdp  # platforms_ops
    cdm  # your_platform/demo_app/my_platform
    cdv  # vademecum app

#### Rails console

On our production machine, `console` logs in to the platform user
and runs the rails console.

#### Rails shortcuts

Some shortcuts for bundler:

    be    # bundle exec, with lcars sound ;)
    bi    # bundle install
    bu    # bundle update

Shortcut for `bin/rake`:

    r

Shortcut for `bin/rails server`:

    s

When starting `pry` within a rails project, the `config/environment`
is used automatically. No need to call `pry -r ./config/environment`
explicitly.

    pry

Ship it! To merge the `master` branch into `production`
just call `production`.

    production

To generate the platform documentation for `cdw` and open it locally,
call:

    doc


#### Testing

Run `bin/rspec` in an orange-colored tab with lcars sounds.

    rspec
    rspec spec/models

Run specs with selenium rather than phantomjs.

    SELENIUM=true rspec spec/features
    selenium spec/features
    selen spec/features



### [welcome.plugin.zsh](oh-my-zsh-customization/plugins/welcome/welcome.plugin.zsh)

This plugins prints some useful information about the current machine
when opening a new terminal.

This is done using [screenfetch](https://github.com/KittyKatt/screenFetch).
Install with `brew install screenfetch`.

Next to the starfleet sign, of course :)

I've taken this from mooos: https://github.com/idk/moo-skel




## Author

(c) 2016, Sebastian Fiedlschuster

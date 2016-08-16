# .zsh

My zsh configuration. I'm using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and place some overrides in `~/.zsh`.

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

# Shell theme:
ZSH_THEME="fiedl"

# Activate auto update. This will fetch oh-my-zsh as
# well as updates from https://github.com/fiedl/dot-zsh.
export UPDATE_ZSH_DAYS=1

# choose oh-my-zsh plugins
plugins=(git bundler fiedl icecube plattform)
```

Then, start a new terminal. Done!

## Update

* The update is done regularly via oh-my-zsh.
* Or, run: `upgrade_oh_my_zsh`
* Or, run it manually: `cd $HOME/.zsh; git pull`

## Documentation

### [fiedl.plugin.zsh](oh-my-zsh-customization/plugins/fiedl/fiedl.plugin.zsh)


#### Updating the zsh configuration

These commands help to sync the zsh configuration up and down.
Through the oh-my-zsh auto update process, the repo is down-synced
automatically. This is prevented by uncommited changes in ~/.zsh.

Quickly commit and push local changes:

    zsh-push

Get latest changes by running one of these:

    zsh-pull
    zsh-update

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


### [welcome.plugin.zsh](oh-my-zsh-customization/plugins/welcome/welcome.plugin.zsh)

This plugins prints some useful information about the current machine
when opening a new terminal.

Next to the starfleet sign, of course :)

I've taken this from mooos: https://github.com/idk/moo-skel


### [icecube.plugin.zsh](oh-my-zsh-customization/plugins/icecube/icecube.plugin.zsh)



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





## Author

(c) 2016, Sebastian Fiedlschuster
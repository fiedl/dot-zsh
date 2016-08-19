# These are some helpers for [Rails](https://github.com/rails/rails)
# and [YourPlatform](https://github.com/fiedl/your_platform).

# ## Directories
#
# Here are some aliases to jump to directories.
# On the development machine, the projects are expected to be in
# `~/rails`, on the production machine, in `/var`.
#
#     cdw  # wingolfsplattform
#     cdy  # your_platform
#     cdo  # your_platform_ops
#     cdp  # platforms_ops
#     cdm  # your_platform/demo_app/my_platform
#     cdv  # vademecum app

if [ -d $HOME/rails ]
then
  alias cdw="cd $HOME/rails/wingolfsplattform"
  alias cdy="cd $HOME/rails/your_platform"
  alias cdo="cd $HOME/rails/your_platform_ops"
  alias cdp="cd $HOME/rails/platforms_ops"
  alias cdm="cd $HOME/rails/your_platform/demo_app/my_platform"
  alias cdv="cd $HOME/code/Vademecum.turbolinks-ios/Vademecum"
fi

if [ -d /var/wingolfsplattform ]
then
  alias cdw='cd /var/wingolfsplattform'
  alias cdo='cd /var/your_platform_ops'
  alias cdp='cd /var/your_platform_ops/ops'
fi


# ## Rails console
#
# On our production machine, `console` logs in to the platform user
# and runs the rails console.

if [ -d /var/wingolfsplattform ]
then
  alias console='cdw &&
    echo "WINGOLFSPLATTFORM PRODUCTION CONSOLE" &&
    su wingolfsplattform -c ". /home/wingolfsplattform/.zshrc &&
      cd /var/wingolfsplattform &&
      bundle exec rails console"'

  export RAILS_ENV=production
fi


# ## Rails shortcuts
#
# Some shortcuts for bundler:
#
#     be    # bundle exec, with lcars sound ;)
#     bi    # bundle install
#     bu    # bundle update
#
alias be='lcars && bundle exec'
alias bi='bundle install'
alias bu='bundle update'

# Shortcut for `bin/rake`:
#
#     r
#
r() { tab_blue; lcars; bin/rake "$@"; lcars; tab-reset; }

# Shortcut for `bin/rails server`:
#
#     s
#
s() { tab_red; lcars; bin/rails server "$@"; tab-reset; }

# When starting `pry` within a rails project, the `config/environment`
# is used automatically. No need to call `pry -r ./config/environment`
# explicitly.
#
#     pry
#
alias pry='
  if [ -d config/environments ]
  then
    be pry -r ./config/environment
  else
    pry
  fi'

# Ship it! To merge the `master` branch into `production`
# just call `production`.
#
#     production
#
alias production='
  if git diff-index --quiet HEAD --
  then
    (git co production && git merge master && git co master)
  else
    echo "There are local changes. Please commit those first."
  fi'

# To generate the platform documentation for `cdw` and open it locally,
# call:
#
#     doc
#
alias doc='cdw && yardoc && chromium-browser doc/index.html && cdy && yardoc && chromium-browser doc/index.html'

# ## Testing
#
# Run `bin/rspec` in an orange-colored tab with lcars sounds.
#
#     rspec
#     rspec spec/models
#
rspec() { tab_orange; lcars; bin/rspec "$@"; lcars; tab-reset; }

# Run specs with selenium rather than phantomjs.
#
#     SELENIUM=true rspec spec/features
#     selenium spec/features
#     selen spec/features
#
alias selenium='SELENIUM=true rspec'
alias selen='selenium'


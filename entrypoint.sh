#!/bin/bash

#=========================================================
#============== ENVIRONMENT VARIABLES ====================
#=========================================================

# Recomended from fastlane docs
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export RUBY_VERSION=2.5.3

#==========================================================
#================== REQUIRED SOFTWARE =====================
#==========================================================

# Node JS and Yarn is required to use reacte native
curl -sL https://deb.nodesource.com/setup_8.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y nodejs yarn

# Ruby is required to use fastlane (macos have ruby already)
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
cd ~/.rbenv/plugins/ruby-build
./install.sh

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

. ~/.bashrc

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
ruby -v

gem install bundler
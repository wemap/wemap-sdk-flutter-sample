#!/bin/zsh

#  setup.sh
#
#
#  Created by Evgenii Khrushchev on 24/09/2018.
#

set -eo pipefail

installBrew() {
  if ! which brew >/dev/null; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Homebrew installed successfully"
  else
    echo "Skipped installing Homebrew, it is already installed"
    echo "Running brew update && brew upgrade"
    brew update && brew upgrade
  fi
}

installRuby() {
  if ! brew list ruby >/dev/null; then
    echo "Installing Ruby"
    brew install ruby
    echo "Ruby installed successfully"
    echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
  else
    echo "Skipped installing Ruby, it's already installed"
  fi
}

installBundler() {
  echo "Installing Bundler"
  gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
  echo "Bundler installed successfully"

  echo "Installing Bundler dependencies"
  bundle install
}

installCocoaPods() {
  if ! which cocoapods >/dev/null; then
    echo "Installing CocoaPods"
    brew install cocoapods
    echo "CocoaPods installed successfully"
  else
    echo "Skipped installing CocoaPods, it is already installed"
  fi
}

installGitHubCLI() {
  if ! which gh >/dev/null; then
    echo "Installing GitHub CLI"
    brew install gh
    echo "GitHub CLI installed successfully"
  else
    echo "Skipped installing GitHub CLI, it is already installed"
  fi
}

########################################################################################################

installBrew
installRuby
installBundler
installCocoaPods

if [ -z "${CI}" ]; then
  echo "No CI tag detected, skipping GitHub CLI installation"
else
  installGitHubCLI
fi
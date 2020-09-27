#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

/usr/local/bin/brew install git

/usr/local/bin/brew tap "homebrew/bundle"
/usr/local/bin/brew tap "homebrew/cask"
/usr/local/bin/brew tap "homebrew/core"


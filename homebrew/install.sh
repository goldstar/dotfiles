#!/usr/bin/env zsh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

BREW_COMMAND=/usr/local/bin/brew

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

${BREW_COMMAND} bundle --file=$HOME/.dotfiles/homebrew/Brewfile install

exit 0

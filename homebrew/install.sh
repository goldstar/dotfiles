#!/bin/sh
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

${BREW_COMMAND} update
${BREW_COMMAND} bundle install
${BREW_COMMAND} upgrade --all
${BREW_COMMAND} cleanup
${BREW_COMMAND} prune

exit 0

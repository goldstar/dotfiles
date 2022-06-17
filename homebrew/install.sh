#!/usr/bin/env zsh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

BREW_COMMAND=$(which brew)

# Check for Homebrew
if test ! $(which brew)
then
  sudo xcodebuild -license
  xcode-select -p
  if [[ "$?" -eq "2" ]]; then
    sudo xcode-select --install
    echo
    echo "Please install 'Command Line Tools for Xcode' (follow instructions on window prompt)"
    echo
    echo "Press any key to continue…"
    read
  fi
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

${BREW_COMMAND} bundle --file=${HOME}/.dotfiles/homebrew/Brewfile install

git_version=$(git --version | grep git | cut -d ' ' -f3)
curl https://raw.githubusercontent.com/git/git/v${git_version}/contrib/completion/git-completion.zsh -o ${HOME}/.dotfiles/functions/_git > /dev/null 2>&1
if [[ "$?" -eq "0" ]]; then
  echo
  echo "git zsh autocompletion installed from source"
  echo
fi

touch "${HOME}/.tmux.conf.local"

exit 0

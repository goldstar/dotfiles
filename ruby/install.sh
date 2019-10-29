#!/usr/bin/env zsh

RUBIES_TO_INSTALL=(2.6.5 2.5.5 2.5.7 2.4.3)
DEFAULT_RUBY_VERSION=${RUBIES_TO_INSTALL[1]}

echo "Installing rubies"
for ruby_ver in ${RUBIES_TO_INSTALL[*]}; do
  ls -x $HOME/.rubies | grep ${ruby_ver} 2> /dev/null
  if [[ "$?" -eq "1" ]]; then
    echo "Installing: ruby-${ruby_ver}"
    ruby-install ruby ${ruby_ver}
  else
    echo "ruby-${ruby_ver} already installed"
  fi
done

echo "Setting default ruby to ${DEFAULT_RUBY_VERSION}"
echo ${DEFAULT_RUBY_VERSION} > $HOME/.ruby-version

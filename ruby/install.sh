#!/usr/bin/env zsh

RUBIES_TO_INSTALL=(2.6.8 2.6.9)
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

echo "To compile mysql2, you may need to run:"
echo
echo 'bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"'
echo "gem install mysql2 -v '0.4.10'"
echo

echo "Setting default ruby to ${DEFAULT_RUBY_VERSION}"
echo ${DEFAULT_RUBY_VERSION} > $HOME/.ruby-version

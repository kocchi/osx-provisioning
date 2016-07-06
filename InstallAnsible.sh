#!/bin/bash

which brew >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "not found command brew"
  echo "install homebrew"
  sudo chown -R `whoami`:staff /usr/local
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


which ansible >/dev/null 2>&1
if [ $? -ne 0 ];
then
  brew install ansible
fi

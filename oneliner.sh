#!/bin/sh
cd ~
if [ -d "dotserver" ]; then
  cd ~/dotserver
  git pull
  cd ~
else
  git clone git://github.com/macovsky/dotserver.git
  ./dotserver/install.sh --force
fi
exec $SHELL
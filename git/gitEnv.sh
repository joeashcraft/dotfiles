#!/bin/bash
set -x

cd ~/dotfiles
git pull || exit 1
if diff -q ssh/authorized_keys ~/.ssh/authorized_keys  ; then
  exit 0
else
  cp -f ssh/authorized_keys ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
fi


exit 0

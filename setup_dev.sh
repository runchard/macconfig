#!/usr/bin/env zsh

pip3 install pipenv

echo "workaround for spotlight/alfred switch issue for emacs version 27.1"
echo "ref: https://spin.atomicobject.com/2019/12/12/fixing-emacs-macos-catalina/#comment-647791"
cd /Applications/Emacs.app/Contents/MacOS
mv Emacs Emacs-launcher
ln -s Emacs-x86_64-10_14 Emacs
mv Emacs.pdmp Emacs-launcher.pdmp
mv Emacs-x86_64-10_14.pdmp Emacs.pdmp
cd /Applications/Emacs.app/Contents/
rm -rf _CodeSignature

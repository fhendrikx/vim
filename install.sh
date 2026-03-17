#!/bin/bash
######################################################################
# VIM Configuration Install
#
# Ferry Hendrikx, February 2020
# Ferry Hendrikx, January 2026
######################################################################

######################################################################
# configuration
######################################################################

VIM_CONF="$HOME/.vimrc"
VIM_HOME="$HOME/.vim"

VIM_BNDL="bundles"


######################################################################
# main
######################################################################

# sanity check

if [ ! -x "/usr/bin/ctags" ]; then
    echo "ERROR: please install universal-ctags"

    exit 1
fi

# sanity check

echo "install: your existing VIM configuration will be overwritten"

read -p "Continue (Y/n)" -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 2
fi


# initialise

echo "install: install configuration"

rm -f  "$VIM_CONF"
rm -rf "$VIM_HOME/bundle"

cp -av vimrc "$VIM_CONF"

if [ ! -d "$VIM_HOME" ]; then
    cp -av vim "$VIM_HOME"
fi

if [ ! -d "$VIM_HOME"/bundle ]; then
    mkdir -p "$VIM_HOME"/bundle
fi


# clone bundles

echo "install: update/install bundles"

while read -r BUNDLE
do
    (cd $VIM_HOME/bundle; git clone $BUNDLE)
done < "$VIM_BNDL"

echo "install: completed"


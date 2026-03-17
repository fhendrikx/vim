
######################################################################
VIM Configuration
######################################################################

Features

- auto backup
- auto linting and syntax checking
- git integration
- indent and indenting level guide
- persistent undo
- search (using ripgrep)
- standard environment (e.g. tab sizes and indenting)
- tag stack
- unix file operations


Installation

To install this configuration, simply run:

   ./install

This will placed the VIM files into your home directory, and fetch the
latest version of the third-party bundles that this configuration uses.


External programs

The following third-party utilities should be installed:

    apt install universal-ctags

The following third-party linters should be installed:

    apt install shellcheck
    apt install libperl-critic-perl

    twig-lint (installed as part of build-bin)


Installed Files

    $HOME/.vimrc            - VIM configuration
    $HOME/.vim/             - VIM home directory
    $HOME/.cache/backup/    - VIM backup files
    $HOME/.cache/undo/      - VIM undo files


Airline support for iTerm2

    Under Preferences > Profiles > Text

    Select "Use built-in Powerline glyphs"


######################################################################
EOF
######################################################################


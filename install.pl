#!/usr/bin/perl -w
#
use strict;
use 5.010;

use Cwd;

!system "git submodule init"  and  !system "git submodule update" or die $!;


# install tmux.conf
!system 'ln -s ' . cwd . '/tmux.conf ' . '$HOME/.tmux.conf'  or die $!;
say "### install tmux.conf Done. ###"

# install zshrc
!system 'ln -s ' . cwd . '/zsh/zshrc ' . '$HOME/.zshrc'  
    and !system 'ln -s ' . cwd . '/zsh ' . '$HOME/.zsh' or die $!;
say "### install zsh Done. ###"

# install vim
!system 'ln -s ' . cwd . '/vim/vimrc ' . '$HOME/.vimrc' 
    and !system 'ln -s ' . cwd . '/vim ' . '$HOME/.vim' or die $!;
say "### install vim Done. ###"




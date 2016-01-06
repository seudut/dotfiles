#!/usr/bin/perl -w

## 1. git clone package manager Vundle
my $vundle_url = "https://github.com/gmarik/Vundle.vim.git";
 
chdir "bundle";
system "git clone " . $vundle_url;

## 2. install packages
#
#
# 3. install YouCompleteMe
# ./install.py --clang-completer


#vim --cmd 'echo "aaaa"';

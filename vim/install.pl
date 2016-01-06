#!/usr/bin/perl -w

## 1. git clone package manager Vundle
my $vundle_url = "https://github.com/gmarik/Vundle.vim.git";
 
chdir "bundle";
system "git clone " . $vundle_url;

## 2. install pacage


#vim --cmd 'echo "aaaa"';

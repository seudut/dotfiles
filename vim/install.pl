#!/usr/bin/perl -w

my $vim_git = $ENV{'PWD'};
my $vim_dir = "$ENV{'HOME'}/.vim";
my $vim_rc = "$ENV{'HOME'}/.vimrc";

## test if vim and vimrc exist
die "~/.vim or ~/.vimrc exists!!, backup them first\n" if -e $vim_dir or -e $vim_rc ;


## add new files	
print `ln -s $vim_git $vim_dir`;
print `ln -s $vim_dir/vimrc $vim_rc`;

## 1. git clone package manager Vundle
my $vundle_url = "https://github.com/gmarik/Vundle.vim.git";

chdir "bundle";
system "git clone " . $vundle_url;

##
## then start vim, and run :BundleInstall to install other packagesj
#
#
# 3. install YouCompleteMe
# ./install.py --clang-completer


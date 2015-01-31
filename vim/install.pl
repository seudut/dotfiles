#!/usr/bin/perl -w

my $vundle_url = "https://github.com/gmarik/Vundle.vim.git";
 
system "cd bundle";
system "git clone " . $vundle_url;
system "ls -l";
system "cd ..";


#vim --cmd 'echo "aaaa"';

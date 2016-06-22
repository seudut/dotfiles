#!/usr/bin/perl -w
#
use 5.010;
use strict;

##my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
my $date = `date +%m%d`;
chomp $date;

if (-e "$ENV{HOME}/.emacs.d" ) {
    say "~/.emacs.d folder already exists, rename as ~/.emacs.d_bak_$date";
    ! system "mv", "$ENV{HOME}/.emacs.d", "$ENV{HOME}/.emacs.d_bak_$date" or die;
}

## link emacs.d folder
! system "ln", "-s", "$ENV{HOME}/dotfiles/emacs.d", "$ENV{HOME}/.emacs.d" or die;
say "DONE";

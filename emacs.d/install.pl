#!/usr/bin/perl -w
#
use 5.010;
use strict;

##my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
chomp (my $date = `date +%m%d`);

if (-e "$ENV{HOME}/.emacs.d" ) {
    print "~/.emacs.d folder already exists.\nRename as ~/.emacs.d_bak_$date and continue yes (y) or no (n)? ";
    chomp (my $yorn = <STDIN>);

    while ($yorn ne "y" and $yorn ne "n") {
        print "Input y or n: ";
        chomp ($yorn = <STDIN>);
    }

    exit if $yorn eq "n";

    ! system "mv", "$ENV{HOME}/.emacs.d", "$ENV{HOME}/.emacs.d_bak_$date" or die
        if $yorn eq "y";
}

## link emacs.d folder
! system "ln", "-s", "$ENV{HOME}/dotfiles/emacs.d", "$ENV{HOME}/.emacs.d" or die;
say "DONE";

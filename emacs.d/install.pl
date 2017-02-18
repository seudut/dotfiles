#!/usr/bin/perl -w
#
#
use strict;
use File::Basename;
use Cwd;
use Cwd "abs_path";


my $home = $ENV{'HOME'};
my $emacsDir = dirname abs_path (__FILE__);

die "~/.emacs.d or ~/init.el exist. Backup them first.\n" 
    if -e "$home/.init.el" or -e "$home/.emacs.d";

print `ln -s $emacsDir $home/.emacs.d`;

print "Done.\n" unless $?;

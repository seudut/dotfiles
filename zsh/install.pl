#!/usr/bin/perl -w

use strict;
use File::Basename;
use Cwd;
use Cwd "abs_path";

my $home = $ENV{'HOME'};
my $zshDir = dirname abs_path(__FILE__);
my $zshrc = $zshDir . "/zshrc";

die "~/.zsh or ~/.zshrc exist. Backup them first.\n" if -e "$home/.zsh" or -e "$home/.zshrc";

print `ln -s $zshDir $home/.zsh`;
print `ln -s $zshrc $home/.zshrc`;

print "Done\n" unless $?;


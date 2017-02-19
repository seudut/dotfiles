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

my $zshsyntaxDir = $zshDir . "plugins/zsh-syntax-highlighting";

if (not -e $zshsyntaxDir) {
    die "zsh syntax highlighting not exist, abort.\n";
} elsif (-s $zshsyntaxDir) {
    print " clone submoduells\n ";
    chdir $zshsyntaxDir;
    ! system "git submodule init" or die $!;
    ! system "git submodule update" or die $!;
} else {
    print "zsh syntax submodule already exists.\n";
}

print "Done\n" unless $?;


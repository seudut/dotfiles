#!/usr/bin/perl -w
#
# https://xnathan.com/2019/05/03/squirrel-wubi-setup/
#
use 5.010;
use strict;
use Cwd;

my @file = qw( default.custom.yaml
                squirrel.custom.yaml
                wubi_pinyin.custom.yaml 
                wubi86.custom.yaml );

my $cdr = cwd();
foreach (@file) {
    print `ln -s $cdr/$_ $ENV{HOME}/Library/Rime/$_`;
}
say "==DONE=="  unless $?;

#!/usr/bin/perl -w
#
use strict;

print `curl https://raw.githubusercontent.com/seudut/blog/master/publish.el -o ./elisp/publish.el`;

#!/usr/bin/perl -w
#
use strict;

print `curl https://raw.githubusercontent.com/seudut/blog/master/blog.el -o ./elisp/blog.el`;

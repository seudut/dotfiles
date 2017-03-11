#!/usr/bin/perl -w
#
use strict;

print `curl https://raw.githubusercontent.com/seudut/blog/master/my-publish.el -o ./elisp/my-publish.el`;

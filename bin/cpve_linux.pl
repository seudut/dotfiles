#!/usr/bin/perl -w
#
use strict;
#use Net::SSH::Perl;

my $diff_file = "temp.diff";
my $remote_machine = 'cpvedev@cpvedev';

!system "svn diff > $diff_file" or die "$!";
!system 'scp ' . $diff_file . ' cpvedev@cpvedev:cpve_trunk/' or die "$!";
my $remote_cmd = ''
!system "ssh  -l cpvedev cpvedev \'cd ~/cpve_trunk && svn revert -R .  && patch -p0 < temp.diff\'" or die "$!";

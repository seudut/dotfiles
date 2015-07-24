#!/usr/bin/perl -w
#
use strict;
use warnings;
use v5.10; ## say

#my $log_file = @ARGV[0];

my $k_start_call = 'originateCall|answercall';
#my $k_start_call = 'originateCall';

# create jabber_full.log to add jabber.log, jabber.log.1, jabber.log.2
my @logs = glob "jabber.log*";
my $full_logs = "jabber_full.log";

#foreach (@logs) { say; }    
#say @logs;
#print @logs;

#print for (reverse @logs);

##open LOGS, ">>$full_logs" or die "$!";
##for (reverse @logs){
##    open SUB_LOG, "<", $_ or die "$!";
##    print LOGS while(<SUB_LOG>) ;
##    close SUB_LOG;
##}
##close LOGS;
##
##for (reverse @logs){
##    !system "cat $_ >> $full_logs" or die "$!";
##}

## merge log files
!system "cat $_ >> $full_logs" or die "$!"  for (reverse @logs);

## split file  with each call
open LOG, "<<$full_logs" or die "$!";

open LOG, "<<$full_logs" or die "$!";
while(<LOG>){

}



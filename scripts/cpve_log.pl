#!/usr/bin/perl -w
#
use strict;
use warnings;
use v5.10; ## say

#my $log_file = @ARGV[0];
#
# TODO:
# 1. append cpve version to the file name of full log
# 2. output critical error of CPVE/PME such as "camera" camera error
# 3. split the full log as sub logs against the call time
# 4. plot the RTP stats

my $k_start_call = 'originateCall|answercall';
#my $k_start_call = 'originateCall';

# create jabber_full.log to add jabber.log, jabber.log.1, jabber.log.2
my $out_dir = `pwd` . '/out/';
my @logs = glob "jabber.log*";
my $full_logs = "$out_dir/jabber_full.log";

#my $cpve_version;

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
!system "cat $_ >> $full_logs" or die "$!"  for reverse @logs;

my $version= 

print "===== write done ====\n";
## split file  with each call
my $call = "call0.log";

open CALL, ">> $call" or die "$!";
open LOG, "<", $full_logs or die "$!";
my $index = 0;
while(<LOG>){
##    print CALL $_;
##    last if /originateCall/;
    if ($_ =~ /originateCall/ ){
        close 
        $index = $index+1;
        open LOG, ">>" "call$index" or die "$!";
        print LOG $_;
    }
}

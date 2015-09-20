#!/usr/bin/perl -w

use strict;

use Getopt::Std;

my %options = ();
getopts("n", \%options);
print "-n $options{n}\n" if defined $options{n};

my $ip = (split / /, `ifconfig | grep "inet .*broadcast"`)[1];

my $cpve_dir = '/Users/peli3-imac/CPVE/cpve_trunk/';
my $ecc_dir = '/Users/peli3-imac/JCC/ecc-p2p-mac/';


#### 
if($options{n})
{
    print "==== don't build CPVE ======\n";
}
else 
{    
    ## building CPVE
    chdir $cpve_dir or die ": $!";
    !system "scons arch=x86_64 platform=darwin debug=True -j16 osxversion=10.10"    or die "building CPVE failed : $!";

    ## remove old cpve libs and replace in ECC
####    chdir $ecc_dir or die ": $!";
    !system "rm -rf $ecc_dir/contrib/cpve/lib/darwin/x86_64/*"     or die "remove libs failed : $!";

    !system "/bin/cp -r $cpve_dir/cpve_trunk/target/dist/lib/darwin/x86_64/* $ecc_dir/contrib/cpve/lib/darwin/x86_64/"     or die "copy libs failed: $!";

}

#### building ecc
chdir $ecc_dir or die ": $!";
!system "python runSconsBuild.py JabberMac64Bit  -j 16  -t no --early_cpve"     or die " building ECC failed : $!";

print "copy bin-s bin-c\n";
###system "rm -rf bin-s binn-c";
!system "/bin/cp -r $ecc_dir/out/bin $ecc_dir/bin-c" or die "$!";
!system "/bin/cp -r $ecc_dir/out/bin $ecc_dir/bin-s" or die "$!";

print "copy config files\n";
!system "/bin/cp $ecc_dir/sss.txt  $ecc_dir/bin-s/cucm-credentials.txt" or die ": $!";
!system "/bin/cp $ecc_dir/ccc.txt  $ecc_dir/bin-c/cucm-credentials.txt" or die ": $!";

print "add p2p server ip\n";
open CONF, ">>", "$ecc_dir/bin-c/cucm-credentials.txt" or  die "error $!";
print CONF "P2P_SERVER_IP=" . $ip . "\n";
close CONF;


print "####### DONE #######\n";

#sub get_local_ip{
#    my @cc = (split / /, `ifconfig | grep "inet .*broadcast"`)[1];
##    @cc[1]; ## return value
##    return @cc[1];
#}

#print CONF "P2P_SERVER_IP=" . &get_local_ip . "\n";

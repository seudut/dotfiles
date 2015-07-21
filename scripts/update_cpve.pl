#!/usr/bin/perl -w

use strict;

use Getopt::Std;

my %options = ();
getopts("n", \%options);
print "-n $options{n}\n" if defined $options{n};

my $ip = (split / /, `ifconfig | grep "inet .*broadcast"`)[1];

if($options{n})
{
    print "==== don't build CPVE ======\n";
}
else 
{    
    print "building cpve\n";
    chdir '/Users/peli3/CPVE/cpve_trunk' or die ": $!";
    !system "scons arch=x86_64 platform=darwin debug=True -j16 osxversion=10.10"    or die "building CPVE failed : $!";

    chdir '/Users/peli3/JCC/ecc-p2p' or die ": $!";
    print "remove cpve libs\n";
    !system "rm -rf ./contrib/cpve/lib/darwin/x86_64/*"     or die "remove libs failed : $!";

    print "copy cpve libs\n";
    !system "/bin/cp -r /Users/peli3/CPVE/cpve_trunk/target/dist/lib/darwin/x86_64/* ./contrib/cpve/lib/darwin/x86_64/"     or die "copy libs failed: $!";

}

print "building ecc\n";
!system "python runSconsBuild.py JabberMac64Bit  -j 16  -t no --early_cpve"     or die " building ECC failed : $!";

print "copy bin-s bin-c\n";
###system "rm -rf bin-s binn-c";
!system "/bin/cp -r out/bin ./bin-c" or die "$!";
!system "/bin/cp -r out/bin ./bin-s" or die "$!";

print "copy config files\n";
!system "/bin/cp ./sss.txt  ./bin-s/cucm-credentials.txt" or die ": $!";
!system "/bin/cp ./ccc.txt  ./bin-c/cucm-credentials.txt" or die ": $!";

print "add p2p server ip\n";
open CONF, ">>", './bin-c/cucm-credentials.txt' or  die "error $!";
#print CONF "P2P_SERVER_IP=" . &get_local_ip . "\n";
print CONF "P2P_SERVER_IP=" . $ip . "\n";
close CONF;


print "####### DONE #######\n";

#sub get_local_ip{
#    my @cc = (split / /, `ifconfig | grep "inet .*broadcast"`)[1];
##    @cc[1]; ## return value
##    return @cc[1];
#}


#!/usr/bin/perl
#
#open IFCONF, 'ifconfig | grep "inet .*broadcast" |' or die 'haha';
#while(<IFCONF>)
#{
##    print $_;
#}
#
#my @cc = split /\s+/, `ifconfig | grep "inet .*broadcast"`;
#my $aa =  `ifconfig | grep "inet .*broadcast"`;
#$_ = $aa;
#print $aa;
#my $aa =~ m/([0-9]{1,3}\.){3}[0-9]{1,3}/;
#print $1;
my $ff = (split / /, `ifconfig | grep "inet .*broadcast"`)[0];
print  "==||" . $ff . "==\n";




#!/usr/bin/perl -w
#
use strict;
#use v5.10;

my @cpve_libs = ( 'libpme.0.dylib', 'libpmexy.1.dylib', 'libpmpxy.1.dylib', 'libtaf.0.dylib', 'libtafxy.1.dylib','libsrtp.dylib' );

my @lib_to_change = ( 'libxml2.2.dylib', 'libssl.dylib', 'libcrypto.dylib' );

for my $ff (@cpve_libs){
    !system '/usr/bin/install_name_tool -change @executable_path/../Frameworks/' . $_ . ' @executable_path/' . $_ . ' ./' . $ff or die "$!"     for @lib_to_change;
}

print  "==DONE==" . "\n";


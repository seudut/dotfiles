#!/usr/bin/perl -w
#
my $filename = "git_lists";

my %hash=();

open FILE, "$filename";
while (<FILE>){
	chomp;
	my ($name, $url) = split;
	$hash{$name} = $url;
}
close FILE;

foreach (values %hash) {
	system "git clone " . $_;
}

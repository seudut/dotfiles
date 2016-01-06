#!/usr/bin/perl -w
#
#
my @git_lists = qw {
    git://github.com/zsh-users/zsh-syntax-highlighting.git
};
#my $filename = "git_lists";

print $git_lists[0];

`git clone $_` foreach @git_lists;

##open FILE, "$filename";
##while (<FILE>){
##	chomp;
##	my ($name, $url) = split;
##	$hash{$name} = $url;
##}
##close FILE;
##
##foreach (values %hash) {
##	system "git clone " . $_;
##}

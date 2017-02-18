#!/usr/bin/perl -w
#
#
use strict;
use File::Basename;
use Cwd;
use Cwd "abs_path";


my $home = $ENV{'HOME'};
my $vimDir = dirname abs_path(__FILE__);
my $vimrc = $vimDir . "/vimrc";

## test if vim and vimrc exist
die "~/.vim or ~/.vimrc exists!!.Backup them first.\n" if -e "$home/.vimrc" or -e "$home/.vim";

### link the files
print `ln -s $vimDir $home/.vim`;
print `ln -s $vimrc $home/.vimrc`;

if ($? == 0) {
    print "Link files Done.\n";
} else {
    die;
}


## check Vundle installation
my $vundleDir = $vimDir . "/bundle/Vundle.vim";

if (not -e "$vundleDir"){
    die "Vundle directory not exists, abort.\n";
} elsif (-s "$vundleDir") {
    print " clone submodules \n";
    chdir $vundleDir;
    ! system "git submodule init" or die $!;
    ! system "git submodule update" or die $!;
} else {
    print "Vundle exists and not empty.\n";
}

print <<'END'
Done. 
Please start vim and run :BundleInstall to install the dependencies plugins.
To install YouCompleteMe, go to the folder and run
./install.py --clang-completer.
END


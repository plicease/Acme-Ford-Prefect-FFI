use strict;
use warnings;
use Test::More tests => 1;
use Acme::Alien::DontPanic;
use File::chdir;

my $dir = Acme::Alien::DontPanic->dist_dir;

diag '';
diag '';
diag '';
diag "dir = $dir";
$CWD = $dir;
diag `ls -laR`;
diag '';
diag '';
diag '';
diag "Acme::Alien::DontPanic->dynamic_libs = ", Acme::Alien::DontPanic->dynamic_libs;
diag '';
diag '';
diag '';


pass 'and so it goes';

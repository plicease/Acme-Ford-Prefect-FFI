BEGIN {
  unless(eval q{ use 5.008001; 1}) {
    print "Perl 5.008001 or better required\n";
    exit;
  }
}
use strict;
use warnings;

use Module::Build;
use Acme::Alien::DontPanic;

my $dontpanic = Acme::Alien::DontPanic->new;

my $cflags = $dontpanic->cflags;
my $libs   = $dontpanic->libs;

my $builder = Module::Build->new(
    module_name       => 'Acme::Ford::Prefect::FFI',
    dist_abstract     => 'FFI test for Alien::Base',
    dist_author       => 'Graham Ollis <plicease@wdlabs.com>',
    license           => 'perl',
    configure_requires => {
      'Module::Build' => 0.38,
      'Acme::Alien::DontPanic' => 0.011,
    },
    build_requires    => {
      'ExtUtils::CBuilder' => 0,
    },
    requires          => {
      'perl'                   => '5.008001',
      'FFI::Platypus'          => 0.08,
      'Acme::Alien::DontPanic' => 0.011,
      'FFI::CheckLib'          => '0.10',
    },
);

$builder->create_build_script;


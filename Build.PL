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
      'Acme::Alien::DontPanic' => 0.009,
    },
    build_requires    => {
      'ExtUtils::CBuilder' => 0,
    },
    requires          => {
      'perl' => '5.008',
      'FFI::Raw' => 0,
      'Acme::Alien::DontPanic' => 0.009,
    },
);

$builder->create_build_script;


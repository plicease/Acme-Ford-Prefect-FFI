package Acme::Ford::Prefect::FFI;

use strict;
use warnings;
use Acme::Alien::DontPanic;
use FFI::Raw;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

our($dll) = Acme::Alien::DontPanic->dynamic_libs;

our $answer = FFI::Raw->new(
  $dll, 'answer',
  FFI::Raw::int,
);

sub answer { $answer->() }

1;

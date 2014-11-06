package Acme::Ford::Prefect::FFI;

use strict;
use warnings;
use Acme::Alien::DontPanic;
use FFI::Raw;

=head1 NAME

Acme::Ford::Prefect - FFI test module for Alien::Base

=head1 SYNOPSIS

 use Acme::Ford::Prefect;
 
 my $answer = Acme::Ford::Prefect::answer(); # == 42 of course

=head1 DESCRIPTION

L<Alien::Base> comprises base classes to help in the construction of C<Alien::> modules.  Modules in the L<Alien> namespace are used to locate and install (if necessary)
external libraries needed by other Perl modules.

This module is a toy module to test the efficacy of the L<Alien::Base> system with its experimental FFI interfaces.  This module depends on another toy module 
L<Acme::Alien::DontPanic> which provides the needed libdontpanic library to be able to tell us the C<answer> to life, the universe and everythin.

=head1 SEE ALSO

=over 4

=item L<FFI::Raw>

=item L<Alien::Base>

=item L<Alien>

=back

=cut

our $VERSION = '0.04';
$VERSION = eval $VERSION;

our($dll) = Acme::Alien::DontPanic->dynamic_libs;
die "no dll found for libdontpanic" unless $dll;

our $answer = FFI::Raw->new(
  $dll, 'answer',
  FFI::Raw::int,
);

sub answer { $answer->() }

1;

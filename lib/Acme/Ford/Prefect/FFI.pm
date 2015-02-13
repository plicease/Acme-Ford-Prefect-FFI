package Acme::Ford::Prefect::FFI;

use strict;
use warnings;
use 5.008001;
use Acme::Alien::DontPanic ();
use FFI::Platypus::Declare;

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

=item L<FFI::Platypus>

=item L<Alien::Base>

=item L<Alien>

=back

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 Graham Ollis

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

our $VERSION = '0.09';
$VERSION = eval $VERSION;

our($dll) = Acme::Alien::DontPanic->dynamic_libs;
die "no dll found for libdontpanic" unless $dll;
lib $dll;

attach answer => [] => int => '';

package
  Acme::Alien::DontPanic;

# this is an experiment and will likely be replaced soon
# by something more perminent in Alien::Base itself.

sub dynamic_libs
{
  my $class = shift;
  if($class->install_type('system'))
  {
    return $class->SUPER::dynamic_libs(@_);
  }
  else
  {
    require File::Spec;
    my $dir = $class->dist_dir;
    if((File::Spec->splitdir((File::Spec->splitpath($dir))[1]))[-2] eq '_alien')
    {
      require FFI::CheckLib;
      return FFI::CheckLib::find_lib(lib => '*', libpath => $dir, recursive => 1);
    }
    else
    {
      return $class->SUPER::dynamic_libs(@_);
    }
  }
}

1;


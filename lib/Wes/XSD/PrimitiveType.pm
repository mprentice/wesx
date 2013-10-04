package Wes::XSD::PrimitiveType;

###########
# * Imports
###########

#########
# * Setup
#########

use Moose::Role;

requires 'parse';
requires 'value';
requires 'to_string';

###################
# * Role attributes
###################

############
# * Builders
############

################
# * Role methods
################

###################
# * Private methods
###################

###########
# * Cleanup
###########

no Moose::Role;
1;

###########
# * Perldoc
###########

__END__

=head1 NAME

Wes::XSD::PrimitiveType - A role for classes representing XML Schema
primitive values

=head1 VERSION

This documentation refers to L<Wes::XSD::PrimitiveType>, currently in development.

=head1 SYNOPSIS

  {
    package My::XSD::Boolean;
    use Types::Standard qw(Bool);
    use Wes::XSD::ParseError;
    use Readonly;
    use Moose;
    with 'Wes::XSD::PrimitiveType';
    has value => (
      is => 'ro',
      isa => Bool,
      required => 1,
    );
    Readonly my %VALUE_OF => ( '0' => 0, 'false' => 0,
                               '1' => 1, 'true' => 1 );
    sub parse {
      my $class = shift;
      my $str = shift;
      if (! exists $VALUE_OF{$str}) {
        Wes::XSD::ParseError->throw();
      }
      my $value = $str eq "1" || $str eq "true";
      return My::XSD::Boolean->new(value => $value);
    }
    sub to_string {
      my $self = shift;
      return $self->value ? 'true' : 'false';
    }
  }

  my $xs_bool = My::XSD::Boolean->parse('false');
  print $xs_bool->to_string . "\n";
  --> 'false'

  my $xs_bool2 = My::XSD::Boolean->parse('flibbergibbet');
  --> throws Wes::XSD::ParseError

=head1 DESCRIPTION

The role L<Wes::XSD::PrimitiveType> is used internally by WesX for
representing values and defining support methods for parsing and
emitting primitive types defined in the L<XML Schema 1.1 Part 2:
Datatypes|http://www.w3.org/TR/xmlschema11-2/>.

=head1 ATTRIBUTES

=head1 METHODS

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 INCOMPATIBILITIES

This module has no known incompatibilities.

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module. Please report problems to
Mike Prentice <L<mjp35@cornell.edu|mailto:mjp35@cornell.edu>>. Patches are
welcome.

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Mike Prentice.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

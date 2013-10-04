package Wes::Parser;

###########
# * Imports
###########

use Carp;
use Readonly;
use MooseX::Types::Moose ':all';

#########
# * Setup
#########

use Moose::Role;

requires 'parse';

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

Wes::Parser - A short description of the module's purpose

=head1 VERSION

This documentation refers to L<Wes::Parser>, currently in development.

=head1 SYNOPSIS

  use Wes::Parser;

=head1 DESCRIPTION

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

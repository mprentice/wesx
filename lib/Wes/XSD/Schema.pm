package Wes::XSD::Schema;

###########
# * Imports
###########

use Carp;
use Readonly;
use Types::XSD ':all';

#########
# * Setup
#########

use XML::Rabbit::Root;

####################
# * Class attributes
####################

# Special namespaces
# See: http://www.w3.org/TR/xmlschema11-1/#sec-nss-special
#      http://www.w3.org/TR/xmlschema11-1/#ns-bindings
add_xpath_namespace fn => 'http://www.w3.org/2005/xpath-functions';
add_xpath_namespace html => 'http://www.w3.org/1999/xhtml';
add_xpath_namespace rddl => 'http://www.rddl.org/';
add_xpath_namespace vc => 'http://www.w3.org/2007/XMLSchema-versioning';
add_xpath_namespace xhtml => 'http://www.w3.org/1999/xhtml';
add_xpath_namespace xlink => 'http://www.w3.org/1999/xlink';
add_xpath_namespace xml => 'http://www.w3.org/XML/1998/namespace';
add_xpath_namespace xs => 'http://www.w3.org/2001/XMLSchema';
add_xpath_namespace xsi => 'http://www.w3.org/2001/XMLSchema-instance';
add_xpath_namespace xsl => 'http://www.w3.org/1999/XSL/Transform';

has_xpath_value targetNamespace => '/xs:schema/@targetNamespace',
    isa => AnyURI;
has_xpath_value version => '/xs:schema/@version', isa => Token;
has_xpath_value finalDefault => '/xs:schema/@finalDefault';

############
# * Builders
############

#################
# * Class methods
#################

###################
# * Private methods
###################

###########
# * Cleanup
###########

finalize_class();

###########
# * Perldoc
###########

__END__

=head1 NAME

Wes::XSD::Schema - A short description of the module's purpose

=head1 VERSION

This documentation refers to L<Wes::XSD::Schema>, currently in development.

=head1 SYNOPSIS

  use Wes::XSD::Schema;

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

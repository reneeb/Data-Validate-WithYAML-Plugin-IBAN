package Data::Validate::WithYAML::Plugin::IBAN;

# ABSTRACT: check whether a given value is a valid IBAN

use strict;
use warnings;

use Carp;
use Algorithm::CheckDigits;

our $VERSION = 0.01;

sub check {
    my ($class, $value, $conf) = @_;

    return CheckDigits('iban')->is_valid( $value );
}

1;

__END__

=pod

=head1 DESCRIPTION

Check if the given value is a valid IBAN

=head1 SYNOPSIS

Your F<test.pl>:

  use Data::Validate::WithYAML;
  
  my $validator = Data::Validate::WithYAML->new( 'validate.yml' );
  my %params    = (
      iban => 'DE013958219385182',
      # more user input
  );
  my %errors = $validator->validate( \%params );

Your F<validate.yml>:

  ---
  bank_account:
    type: required
    plugin: IBAN

=cut

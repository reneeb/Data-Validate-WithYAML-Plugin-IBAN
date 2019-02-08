package Data::Validate::WithYAML::Plugin::IBAN;

# ABSTRACT: check whether a given value is a valid IBAN

use strict;
use warnings;

use Carp;
use Algorithm::CheckDigits;

our $VERSION = 0.03;

sub check {
    my ($class, $value, $conf) = @_;

    return CheckDigits('iban')->is_valid( $value );
}

1;

__END__

=pod

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

=head1 METHODS

=head2 check

This checks if a given value is a valid IBAN. More information about
the I<International Bank Account Number> is available on
L<Wikipedia|https://en.wikipedia.org/wiki/International_Bank_Account_Number>.

C<Data::Validate::WithYAML::Plugin::IBAN> uses L<Algorithm::CheckDigits>
for the IBAN verification.

=cut

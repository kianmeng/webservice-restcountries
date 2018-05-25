package WebService::RESTCountries;

use utf8;
use Moo;
use Types::Standard qw(Str);
use strictures 2;
use namespace::clean;

with 'Role::REST::Client';

our $VERSION = '0.01';

has api_url => (
    isa => Str,
    is => 'rw',
    default => sub { 'https://restcountries.eu/rest/v2/' },
);

sub BUILD {
    my ($self) = @_;

    $self->set_persistent_header('User-Agent' => __PACKAGE__ . q| |
          . ($WebService::RESTCountries || q||));
    $self->server($self->api_url);

    return $self;
}

sub _request {
    my ($self, $endpoint, $queries) = @_;

    $endpoint ||= q||;
    $queries ||= {};

    # In case the api_url was updated.
    $self->server($self->api_url);
    $self->type(qq|application/json|);

    my $path = $endpoint . "/";

    my $response = $self->get($path, $queries);

    return $response->data;
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::RESTCountries - A Perl module to interface with the REST Countries
(restcountries.eu) webservice.

=head1 SYNOPSIS

  use WebService::RESTCountries;

=head1 DESCRIPTION

WebService::RESTCountries is a Perl client helper library for the REST
Countries API (restcountries.eu).

=head1 METHODS

=head2 new([%$args])

Construct a new WebService::RESTCountries instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $api = WebService::RESTCountries->new;

=head3 api_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $api = WebService::RESTCountries->new(api_url => 'https://example.com/v2/');

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut

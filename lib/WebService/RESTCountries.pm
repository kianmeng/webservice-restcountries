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
          . ($WebService::RESTCountries::VERSION || q||));
    $self->server($self->api_url);

    return $self;
}

sub search_all {
    my ($self) = @_;

    return $self->_request('all');
}

sub search_by_country_name {
    my ($self, $name) = @_;

    utf8::encode($name);

    return $self->_request(qq|name/$name|);
}

sub search_by_country_full_name {
    my ($self, $full_name) = @_;

    utf8::encode($full_name);

    my $result = $self->_request(qq|name/$full_name|, {fullText => 'true'});

    return (ref $result eq 'ARRAY') ? $result->[0] : $result;
}

sub search_by_country_code {
    my ($self, $country_code) = @_;

    my $result = $self->_request(qq|alpha/$country_code|);

    return (ref $result eq 'ARRAY') ? $result->[0] : $result;
}

sub search_by_country_codes {
    my ($self, $country_codes) = @_;
}

sub search_by_currency {
    my ($self, $currency) = @_;
}

sub search_by_language_code {
    my ($self, $language_code) = @_;
}

sub search_by_capital_city {
    my ($self, $capital_city) = @_;
}

sub search_by_calling_code {
    my ($self, $calling_code) = @_;
}

sub search_by_region {
    my ($self, $region) = @_;
}

sub search_by_regional_bloc {
    my ($self, $region_bloc) = @_;
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

=head2 search_all()

Get all the countries.

=head2 search_by_calling_code
=head2 search_by_capital_city

=head2 search_by_country_code

Get the details of a country by its ISO 3166 two-letters or three-letters
country code.

    # Two-letters.
    $api->search_by_country_code("MY");

    # Three-letters.
    $api->search_by_country_code("MYS");

=head2 search_by_country_codes
=head2 search_by_country_full_name

Get the details of a country by its full name.

    $api->search_by_country_full_name("São Tomé and Príncipe");

=head2 search_by_country_name($name)

Get the details of a country by name, either by native or partial name.

    # Native name.
    $api->search_by_country_name("Malaysia");

    # Partial name.
    $api->search_by_country_name("Malays");

=head2 search_by_currency
=head2 search_by_language_code
=head2 search_by_region
=head2 search_by_regional_bloc

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut

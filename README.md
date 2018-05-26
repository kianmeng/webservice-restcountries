# NAME

WebService::RESTCountries - A Perl module to interface with the REST Countries
(restcountries.eu) webservice.

# SYNOPSIS

    use WebService::RESTCountries;

# DESCRIPTION

WebService::RESTCountries is a Perl client helper library for the REST
Countries API (restcountries.eu).

# METHODS

## new(\[%$args\])

Construct a new WebService::RESTCountries instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $api = WebService::RESTCountries->new;

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $api = WebService::RESTCountries->new(api_url => 'https://example.com/v2/');

## search\_all()

Get all the countries.

## search\_by\_calling\_code

Get the details of a country by its calling code, the prefixes for the country
phone numbers.

    $api->search_by_calling_code('60');

## search\_by\_capital\_city

Get the details of a country by its capital city.

    $api->search_by_capital_city("Kuala Lumpur");

## search\_by\_country\_code

Get the details of a country by its ISO 3166 two-letters or three-letters
country code.

    # Two-letters.
    $api->search_by_country_code("MY");

    # Three-letters.
    $api->search_by_country_code("MYS");

## search\_by\_country\_codes
=head2 search\_by\_country\_full\_name

Get the details of a country by its full name.

    $api->search_by_country_full_name("São Tomé and Príncipe");

## search\_by\_country\_name($name)

Get the details of a country by name, either by native or partial name.

    # Native name.
    $api->search_by_country_name("Malaysia");

    # Partial name.
    $api->search_by_country_name("Malays");

## search\_by\_currency

Get the details of a country by ISO 4217 currency code.

    $api->search_by_currency("MYR");

## search\_by\_language\_code

Get the details of the a country by ISO 639-1 language code.

    $api->search_by_language_code("ms");

## search\_by\_region
=head2 search\_by\_regional\_bloc

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>

[![Build Status](https://travis-ci.org/kianmeng/webservice-restcountries.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-restcountries)
[![codecov](https://codecov.io/gh/kianmeng/webservice-restcountries/branch/master/graph/badge.svg)](https://codecov.io/gh/kianmeng/webservice-restcountries)
[![Coverage Status](https://coveralls.io/repos/kianmeng/webservice-restcountries/badge.svg?branch=master)](https://coveralls.io/r/kianmeng/webservice-restcountries?branch=master)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/WebService-RESTCountries.png)](http://cpants.charsbar.org/dist/overview/WebService-RESTCountries)
[![Cpan license](https://img.shields.io/cpan/l/WebService-RESTCountries.svg)](https://metacpan.org/release/WebService-RESTCountries)
[![Cpan version](https://img.shields.io/cpan/v/WebService-RESTCountries.svg)](https://metacpan.org/release/WebService-RESTCountries)

# NAME

WebService::RESTCountries - A Perl module to interface with the REST Countries
(restcountries.eu) webservice.

# SYNOPSIS

    use WebService::RESTCountries;

    my $api = WebService::RESTCountries->new;
    $api->search_all();

# DESCRIPTION

WebService::RESTCountries is a Perl client helper library for the REST
Countries API (restcountries.eu).

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-restcountries](https://github.com/kianmeng/webservice-restcountries).

## Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-restcountries .
    $ docker run -it -v $(pwd):/root webservice-restcountries bash
    # cpanm --installdeps --notest .

## Milla

Setting up the required packages.

    $ milla authordeps --missing | cpanm
    $ milla listdeps --missing | cpanm

Check you code coverage.

    $ milla cover

Several ways to run the test.

    $ milla test
    $ milla test --author --release
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla test
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla run prove t/01_instantiation.t
    $ LOGGING=1 milla run prove t/t/02_request.t

Release the module.

    $ milla build
    $ milla release

# METHODS

## new(\[%$args\])

Construct a new WebService::RESTCountries instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $api = WebService::RESTCountries->new;

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $api = WebService::RESTCountries->new(api_url => 'https://example.com/v2/');

    # Set through method.
    $api->api_url('https://example.com/v2/');

### fields

Show the country data in specified fields. Do this before making any webservice
calls.

    # Instantiate the class by setting the selected fields.
    my $api = WebService::RESTCountries->new(fields => ['capital', 'currencies', 'name']);

    # Set through method.
    $api->fields(['capital', 'currencies', 'name']);
    my $counties = $api->search_all();

## ping()

Check whether the API endpoint is currently up.

    # Returns 1 if up and 0 otherwise.
    $api->ping();

## download(\[$file\_name\])

Download the whole countries data as JSON file. Optional path and file name.

    # Using default path and file name.
    $api->download();

    # Using specific path and file name.
    $api->download('/tmp/countries.json');

Check whether the API endpoint is currently up.

    # Returns 1 if up and 0 otherwise.
    $api->ping();

## search\_all()

Get all the countries. Basically just pull the whole data in JSON format.

    $api->search_all();

## search\_by\_calling\_code($calling\_code)

Get the details of a country by its calling code, the prefixes for the country
phone numbers.

    $api->search_by_calling_code('60');

## search\_by\_capital\_city($capital\_city)

Get the details of a country by its capital city.

    # Full name.
    $api->search_by_capital_city("Kuala Lumpur");

    # Partial name.
    $api->search_by_capital_city("Kuala");

## search\_by\_country\_code($country\_code)

Get the details of a country by its ISO 3166 two-letters or three-letters
country code.

    # Two-letters.
    $api->search_by_country_code("MY");

    # Three-letters.
    $api->search_by_country_code("MYS");

## search\_by\_country\_codes($country\_codes)

Get the list of country by multiple ISO 3166 two-letters or three-letters
country codes.

    # Two-letters.
    $api->search_by_country_codes(['MY', 'SG']);

    # Three-letters.
    $api->search_by_country_codes(['MYS', 'SGP']);

## search\_by\_country\_full\_name($full\_name)

Get the details of a country by its full name.

    $api->search_by_country_full_name("São Tomé and Príncipe");

## search\_by\_country\_name($name)

Get the details of a country by name, either by native or partial name.

    # Native name.
    $api->search_by_country_name("Malaysia");

    # Partial name.
    $api->search_by_country_name("Malays");

## search\_by\_currency($currency)

Get the details of a country by ISO 4217 currency code.

    $api->search_by_currency("MYR");

## search\_by\_language\_code($language\_code)

Get the details of the a country by ISO 639-1 language code.

    $api->search_by_language_code("ms");

## search\_by\_region($region)

Get list of country by region: Africa, Americas, Asia, Europe, Oceania. Region
name is case insensitive.

    $api->search_by_region("Asia");
    $api->search_by_region("asia");

## search\_by\_regional\_bloc($regional\_bloc)

Get list of country by regional bloc: EU, EFTA, CARICOM, PA, AU, USAN, EEU, AL,
ASEAN, CAIS, CEFTA, NAFTA, SAARC. Regional bloc name is case insensitive.

    $api->search_by_region_bloc("EU");
    $api->search_by_regional_bloc("asean");

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>

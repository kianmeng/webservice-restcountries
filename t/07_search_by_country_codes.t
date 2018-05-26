use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my $got;

my $api = WebService::RESTCountries->new;

$got = $api->search_by_country_codes(['MY', 'SG']);
is(scalar @$got, 2, 'expect 2 countries found by two-letters country code');

$got = $api->search_by_country_codes(['MYS', 'SGP']);
is(scalar @$got, 2, 'expect 2 countries found by three-letters country code');

$got = $api->search_by_country_codes(['MY', 'SGP']);
is(scalar @$got, 2, 'expect 2 countries found by two-letters and three-letters country code');

$got = $api->search_by_country_codes(['SGG']);
is($got, undef, 'expect no country found by invalid country code');

done_testing;

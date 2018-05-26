use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my $got;

my $api = WebService::RESTCountries->new;

$got = $api->search_by_country_code('MY');
is($got->{capital}, "Kuala Lumpur", 'expect country found by two-letters country code');

$got = $api->search_by_country_code('MYS');
is($got->{capital}, "Kuala Lumpur", 'expect country found by three-letters country code');

done_testing;

use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my $got;

my $api = WebService::RESTCountries->new;

$got = $api->search_all();

is(scalar @$got, 250, 'expect 250 countries found');

done_testing;

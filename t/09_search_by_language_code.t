use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $expected);

my $api = WebService::RESTCountries->new;

$got = $api->search_by_language_code('ms');
is(scalar @$got, 2, 'expect countries found by language code');

$got = $api->search_by_language_code('mss');
$expected = {
    'message' => 'Not Found',
    'status' => 404
};
is_deeply($got, $expected, 'expected bad request');

done_testing;

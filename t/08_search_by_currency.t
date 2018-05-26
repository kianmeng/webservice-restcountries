use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $expected);

my $api = WebService::RESTCountries->new;

$got = $api->search_by_currency('MYR');
is($got->{name}, 'Malaysia', 'expect country found by currency code');

$got = $api->search_by_currency('RM');
$expected = {
    'message' => 'Bad Request',
    'status' => 400
};
is_deeply($got, $expected, 'expected bad request');
is($got->{name}, undef, 'expect country not found by invalid currency code');

done_testing;

use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $expected);

my $api = WebService::RESTCountries->new;

$got = $api->search_by_capital_city('Kuala Lumpur');
is($got->{name}, 'Malaysia', 'expect country found by capital city');

$got = $api->search_by_capital_city("Saint John's");
is($got->{name}, 'Antigua and Barbuda', 'expect country found by capital city');

$got = $api->search_by_capital_city('');
is(%$got, 0, 'expect no country found by capital city');

$got = $api->search_by_currency('Kuala');
$expected = {
    'message' => 'Bad Request',
    'status' => 400
};
is_deeply($got, $expected, 'expected bad request');
is($got->{name}, undef, 'expect country not found by invalid capital city');

done_testing;

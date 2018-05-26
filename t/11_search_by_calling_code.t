use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $expected);

my $api = WebService::RESTCountries->new;

$got = $api->search_by_calling_code('60');
is($got->{name}, 'Malaysia', 'expect country found by calling code');

$got = $api->search_by_calling_code('886');
is($got->{name}, 'Taiwan', 'expect country found by calling code');

$got = $api->search_by_calling_code('');
is(%$got, 0, 'expect no country found by calling code');

$got = $api->search_by_calling_code('888');
$expected = {
    'message' => 'Not Found',
    'status' => 404
};
is_deeply($got, $expected, 'expect not found');

done_testing;

use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $expected);

my $api = WebService::RESTCountries->new;

my $countries_counts_per = {
    Africa => 60,
    Americas => 57,
    Asia => 50,
    Europe => 53,
    Oceania => 27,
};

foreach my $region (keys %$countries_counts_per) {
    $got = $api->search_by_region($region);
    is(scalar @$got, $countries_counts_per->{$region}, "expect countries counts per region: $region match");
}

$got = $api->search_by_region('milky way');
$expected = {
    'message' => 'Not Found',
    'status' => 404
};
is_deeply($got, $expected, 'expect not found');

done_testing;

use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($got, $total_country) = ('', 250);

my $api = WebService::RESTCountries->new(
    cache => CHI->new(
        driver => 'File',
        namespace => 'restcountries',
        root_dir => $ENV{PWD} . '/t/cache/',
    ));

$got = $api->search_all();
is(scalar @{$got}, $total_country, qq|expect $total_country countries found|);

my $expected_fields = ['capital', 'currencies', 'name'];
$api->fields($expected_fields);
$got = $api->search_all();
my @got_fields = sort keys %{$got->[0]};
is_deeply(\@got_fields, $expected_fields, 'expect selected fields match');

done_testing;

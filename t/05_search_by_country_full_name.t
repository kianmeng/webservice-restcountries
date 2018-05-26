use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my $got;

my $api = WebService::RESTCountries->new;

my $test_data = {
    Malays => undef,
    Malaysia => 'Malaysia',
    Liechtenstein => 'Liechtenstein',
    'Burkina Faso' => 'Burkina Faso',
    'Federated States of Micronesia' => 'Micronesia (Federated States of)',
    'Saint Vincent and the Grenadines' => 'Saint Vincent and the Grenadines',
    'São Tomé and Príncipe' => 'Sao Tome and Principe',
};

foreach my $k (keys %$test_data) {
    $got = $api->search_by_country_full_name($k);

    my $status = ($got->{name}) ? 'found' : 'not found';
    is($got->{name}, $test_data->{$k}, "expect country $k $status");
}

done_testing;

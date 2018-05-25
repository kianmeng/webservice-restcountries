use strict;
use warnings;
use utf8;

use Test::More;
use Test::Warn;

use WebService::RESTCountries;

my $api;
$api = WebService::RESTCountries->new;
is($api->api_url, 'https://restcountries.eu/rest/v2/', 'expect API URL match');

$api = WebService::RESTCountries->new(api_url => 'https://example.com/rest/v2/');
is($api->api_url, 'https://example.com/rest/v2/', 'expect API URL match');

done_testing;

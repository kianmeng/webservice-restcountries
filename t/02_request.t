use strict;
use warnings;
use utf8;

use Test::More;

use WebService::RESTCountries;

my ($response, $expect) = ('', '');

my $api = WebService::RESTCountries->new;

$expect = {};
$response = $api->_request();
is_deeply($response, $expect, 'expect empty response');

done_testing;

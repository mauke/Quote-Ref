use warnings FATAL => 'all';
no warnings 'qw';
use strict;

use Test::More tests => 6;

use Quote::Ref;

is_deeply qa(), [];
is_deeply qh(), {};

is_deeply qa~a b cee dee~, [qw~a b cee dee~];
is_deeply qh~a b cee dee~, {qw~a b cee dee~};

is_deeply qa<f'oo ba"r b<a>z qu#x>, [qw<f'oo ba"r b<a>z qu#x>];
is_deeply qh<f'oo ba"r b<a>z qu#x>, {qw<f'oo ba"r b<a>z qu#x>};

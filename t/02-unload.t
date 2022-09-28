use warnings FATAL => 'all';
use strict;

use Test::More tests => 9;

use Quote::Ref ();

is eval('qwa]1]'), undef;
like $@, qr/syntax error/;

{
	use Quote::Ref;
	is_deeply qwa]1], [qw]1]];
}

is eval('qwa]1]'), undef;
like $@, qr/syntax error/;

use Quote::Ref;
is_deeply qwa]1], [qw]1]];

{
	no Quote::Ref;
	is eval('qwa]1]'), undef;
	like $@, qr/syntax error/;
}

is_deeply qwa]1], [qw]1]];

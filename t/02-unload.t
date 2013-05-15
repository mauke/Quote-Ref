use warnings FATAL => 'all';
use strict;

use Test::More tests => 9;

use Quote::Ref ();

is eval('qa]1]'), undef;
like $@, qr/Number found where operator/;

{
	use Quote::Ref;
	is_deeply qa]1], [qw]1]];
}

is eval('qa]1]'), undef;
like $@, qr/Number found where operator/;

use Quote::Ref;
is_deeply qa]1], [qw]1]];

{
	no Quote::Ref;
	is eval('qa]1]'), undef;
	like $@, qr/Number found where operator/;
}

is_deeply qa]1], [qw]1]];

use warnings FATAL => 'all';
use strict;
use utf8;

use Test::More tests => 6;

use Quote::Ref;

is_deeply qa∘foo bar baz∘, [qw∘foo bar baz∘];
is_deeply qh∘foo bar baz "∘, {qw∘foo bar baz "∘};

is_deeply qa∘foo ∞ ♥ bar∘, [qw∘foo ∞ ♥ bar∘];
is_deeply qh∘foo ∞ ♥ bar∘, {qw∘foo ∞ ♥ bar∘};

is_deeply qa∘\\\∘ \\ \∘ \\∘, [qw∘\\\∘ \\ \∘ \\∘];
is_deeply qh∘\\\∘ \\ \∘ \\∘, {qw∘\\\∘ \\ \∘ \\∘};

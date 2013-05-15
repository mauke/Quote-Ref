package Quote::Ref;

use v5.12.0;

use warnings;

use Carp qw(croak);

use XSLoader;
BEGIN {
	our $VERSION = '0.01';
	XSLoader::load __PACKAGE__, $VERSION;
}

my %export = (
	qa => HINTK_QA,
	qh => HINTK_QH,
);

sub import {
	my $class = shift;

	my @todo;
	for my $item (@_) {
		push @todo, $export{$item} || croak qq{"$item" is not exported by the $class module};
	}
	for my $item (@todo ? @todo : values %export) {
		$^H{$item} = 1;
	}
}

sub unimport {
	my $class = shift;
	my @todo;
	for my $item (@_) {
		push @todo, $export{$item} || croak qq{"$item" is not exported by the $class module};
	}
	for my $item (@todo ? @todo : values %export) {
		delete $^H{$item};
	}
}

'ok'

__END__

=encoding UTF-8

=head1 NAME

Quote::Ref - qw for array/hash references

=head1 SYNOPSIS

 use Quote::Ref;

 my $aref = qa(foo bar baz);  # $aref = [ qw(foo bar baz) ]
 my $href = qh(foo 1 bar 2);  # $href = { qw(foo 1 bar 2) }

=head1 DESCRIPTION

This module provides the new keywords C<qa> and C<qh>.

=head2 qa

C<qa> is a quoting operator like L<q or qq|perlop/Quote-and-Quote-like-Operators>.
It works like C<qw> in that it parses its contents as a list of whitespace
separated words, but instead of turning them into a list, it turns them into an
array reference. That is, C<qa!...!> works like C<[ qw!...! ]>.

=head2 qh

C<qh> is a quoting operator like L<q or qq|perlop/Quote-and-Quote-like-Operators>.
It works like C<qw> in that it parses its contents as a list of whitespace
separated words, but instead of turning them into a list, it turns them into an
hash reference. That is, C<qh!...!> works like C<{ qw!...! }>.

=head1 AUTHOR

Lukas Mai, C<< <l.mai at web.de> >>

=head1 COPYRIGHT & LICENSE

Copyright 2013 Lukas Mai.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

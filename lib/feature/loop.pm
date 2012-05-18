package feature::loop;

use strict;
use warnings;

use version; our $VERSION = qv('v1.3.0');

use Devel::CallParser qw( );
use XSLoader          qw( );

XSLoader::load('feature::loop', $VERSION);

sub import {
    require Lexical::Sub;
    Lexical::Sub->import( loop => \&loop );
}

sub unimport {
    require Lexical::Sub;
    Lexical::Sub->unimport( loop => \&loop );
}

1;


__END__

=head1 NAME

feature::loop - Provides the C<loop BLOCK> syntax for unconditional loops.


=head1 VERSION

Version 1.3.0


=head1 SYNOPSIS

    use feature::loop;

    loop {
       ...
       last if ...;
       ...
    }


=head1 DESCRIPTION

feature::loop is a lexically-scoped pragma that
provides the C<loop BLOCK> syntax for unconditional loops.

This module serves as a demonstration of the
L<C<cv_set_call_parser>|perlapi/cv_set_call_parser> and
L<C<cv_set_call_checker>|perlapi/cv_set_call_checker>
Perl API calls.


=head2 C<< use feature::loop; >>

Enables the use of C<loop BLOCK> until the end of the current lexical scope.


=head2 C<< no feature::loop; >>

Restores the standard behaviour of C<loop> (a sub call) until the end of the current lexical scope.


=head2 C<< loop BLOCK >>

Repeatedly executes the BLOCK until it is exited using C<last>, C<return>, C<die>, etc.

In other words, it behaves just like all of the following:

=over

=item * C<for (;;) BLOCK>

=item * C<while (1) BLOCK>

=item * C<while () BLOCK>

=back

Like other flow control statements, there is no need to
terminate the statement with a semi-colon (C<;>).


=head1 SEE ALSO

=over 4

=item * L<Devel::CallParser>

=item * L<Devel::CallChecker>

=item * L<Lexical::Sub>

=item * L<perlapi>

=back


=head1 BUGS

Please report any bugs or feature requests to C<bug-feature-loop at rt.cpan.org>,
or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=feature-loop>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc feature::loop

You can also look for information at:

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/feature-loop>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=feature-loop>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/feature-loop>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/feature-loop>

=back


=head1 AUTHOR

Eric Brine, C<< <ikegami@adaelis.com> >>


=head1 COPYRIGHT & LICENSE

No rights reserved.

The author has dedicated the work to the Commons by waiving all of his
or her rights to the work worldwide under copyright law and all related or
neighboring legal rights he or she had in the work, to the extent allowable by
law.

Works under CC0 do not require attribution. When citing the work, you should
not imply endorsement by the author.


=cut

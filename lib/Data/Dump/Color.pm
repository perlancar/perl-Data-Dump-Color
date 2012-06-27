package Data::Dump::Color;

use 5.010;
use strict;
use warnings;

use Data::Dump::Filtered qw();
use Scalar::Util qw(looks_like_number blessed);
use String::Escape qw(qqbackslash);
use Term::ANSIColor;

use Exporter::Lite;
our @EXPORT = qw(dd);

# VERSION

sub dd {
    state $c0 = color("reset");
    my $last_depth = -1;
    my @last_containers;
    my @i;

    return Data::Dump::dd(@_) unless -t STDOUT;
    Data::Dump::Filtered::dump_filtered(
        @_,
        sub {
            my ($ctx, $oref) = @_;
            my $res;

            #if ($ctx->depth > $last_depth) {
            #    push @last_containers, $ctx->is_array ? "array" :
            #        $ctx->is_hash ? "hash" : $ctx->reftype;
            #    push @i, 0;
            #} elsif ($ctx->depth < $last_depth) {
            #    pop @last_containers;
            #    pop @i;
            #} else {
            #    $i[-1]++;
            #}

            if ($ctx->is_scalar) {
                $res = {};
                if (!defined $$oref) {
                    $res->{dump} = color("bright_red")."undef".$c0;
                } elsif (looks_like_number($$oref)) {
                    $res->{dump} = color("bright_blue").$$oref.$c0;
                } else {
                    $res->{dump} = color("bright_yellow").qqbackslash($$oref).$c0;
                }
                #$res->{comment} = color("green")."[$i[-1]]".$c0
                #    if @i && $last_containers[-2] eq 'array';
                #$res->{comment} = "i:".join(",", @i).", lc=".join(",",@last_containers);
            } elsif ($ctx->is_code) {
                $res = {};
                $res->{dump} = color("bright_cyan")."sub { ... }".$c0;
            #} elsif ($ctx->class && $ctx->class eq 'Regexp') {
            #    $res = {};
            #    $res->{dump} = color("yellow").$$oref.$c0;
            }

            #$last_depth = $ctx->depth;

            return unless $res;
            $res;
        }
    );
}

1;
# ABSTRACT: Data::Dump, but with color

=head1 SYNOPSIS

 use Data::Dump::Color;
 dd(...);


=head1 DESCRIPTION

WARNING: This is purely a proof-of-concept release.

Data::Dump::Color is a drop-in replacement for L<Data::Dump>, but dumps with
color when output is terminal. The goal is producing pretty dumps that are nice
to look at. Data::Dump is a nice basis since its dumps are already quite pretty
(vertically aligned, etc).

Aside from color, there are a couple of niceties too like adding comments
containing array indices and total number of hash pairs.


=head1 FUNCTIONS

=head2 dd(...)

Dump one or more data structures.


=head1 TODO

=over 4

=item * Color themes, including ones that support 256 colors.

=back


=head1 SEE ALSO

L<Data::Dump>

L<Data::Printer>

=cut

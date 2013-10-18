#!/usr/bin/perl

use Data::Dump::Color;

dd({
    undef => undef,

    # strings
    str => 'Jason',
    str_empty => '',
    str_with_newlines => "Mark\nJason\nDominus",

    # numbers
    num_int => 45,
    num_neg_int => -45,
    num_float => 0.23,
    num_neg_float => -0.23,
    num_str_int => "45",
    num_neg_str_int => "-45",
    num_str_float => "0.23",
    num_neg_str_float => "-0.23",
    num_nan => nan,
    num_inf => inf,
    num_neg_nan => -nan,
    num_neg_inf => -inf,
    num_exp => 1.2e+100,
    num_neg_exp => -1.2e-101,

    # arrays
    array => [1, 2.2, "3", "a", "b", undef, []],
    array_empty => [],
    array_long => [qw/For backward compatibility with older implementations that
                      didn't support anonymous globs/],

    # hashes
    hash => {a=>1, b=>2, c=>[], d=>{}, e=>undef},
    hash_empty => {},
    hash_long => {qw/For backward compatibility with older implementations that
                     didn't support anonymous globs/},

    # objects
    obj => bless({a=>1, b=>2}, "Foo"),

    # others
    regexp => qr/^ab(?:cd)$/i,
    glob => \*FOO,
    circular => do { my $a = [1]; push @$a, $a; $a },
});

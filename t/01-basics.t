#!perl -T

use 5.010;
use strict;
use warnings;
use Test::More 0.98;
use Test::Exception;

use Capture::Tiny qw(capture);
use Data::Dump::Color qw(dump dd ddx);

local $Data::Dump::Color::COLOR = 0;
local $Data::Dump::Color::COLOR_THEME = "Default16";

subtest dump => sub {
    lives_ok { dump([1]) };

    is_deeply(dump([1, 2, 3]), "[1, 2, 3]");
    my $var = [0,1,[],3]; $var->[1] = $var->[2];
    is_deeply(dump($var), q(do {
  my $var = [0, [], '$var->[1]', 3];
  $var->[2] = $var->[1];
  $var;
}));
};

subtest dd => sub {
    my ($stdout, $stderr, $exit);
    lives_ok {
        ($stdout, $stderr, $exit) = capture { dd [1] };
    };
    like($stdout, qr/\A\Q[1]\E/);
};

subtest ddx => sub {
    my ($stdout, $stderr, $exit);
    lives_ok {
        ($stdout, $stderr, $exit) = capture { ddx [1] };
    };
    like($stdout, qr/\Q01-basics.t\E:.*\Q[1]\E/);
};

DONE_TESTING:
done_testing;

__END__
# disabled for now
is(dd([1, 2, 3]), "[1, 2, 3]\n", "[1, 2, 3]");

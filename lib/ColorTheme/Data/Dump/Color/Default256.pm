package ColorTheme::Data::Dump::Color::Default256;

use strict;
use parent 'ColorThemeBase::Static::FromStructColors';

# AUTHORITY
# DATE
# DIST
# VERSION

sub _ansi256fg {
    my $code = shift;
    return {ansi_fg=>"\e[38;5;${code}m"};
}

our %THEME = (
    v => 2,
    items => {
        Regexp  => _ansi256fg(135),
        undef   => _ansi256fg(124),
        number  => _ansi256fg(27),
        float   => _ansi256fg(51),
        string  => _ansi256fg(226),
        object  => _ansi256fg(10),
        glob    => _ansi256fg(10),
        key     => _ansi256fg(202),
        comment => _ansi256fg(34),
        keyword => _ansi256fg(21),
        symbol  => _ansi256fg(51),
        linum   => _ansi256fg(10),
    },
);

1;
# ABSTRACT: Default color theme for Data::Dump::Color (256 color)

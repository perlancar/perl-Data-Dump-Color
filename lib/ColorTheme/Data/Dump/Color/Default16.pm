package ColorTheme::Data::Dump::Color::Default16;

# AUTHORITY
# DATE
# DIST
# VERSION

use parent 'ColorThemeBase::Static::FromStructColors';
use Term::ANSIColor;

sub _ansi16 {
    my ($fg, $bg) = @_;
    return {
        (defined $fg ? (ansi_fg=>color($fg)) : ()),
        (defined $bg ? (ansi_bg=>color($bg)) : ()),
    };
}

our %THEME = (
    v => 2,
    items => {
        Regexp  => _ansi16('yellow'),
        undef   => _ansi16('bright_red'),
        number  => _ansi16('bright_blue'), # floats can have different color
        float   => _ansi16('cyan'),
        string  => _ansi16('bright_yellow'),
        object  => _ansi16('bright_green'),
        glob    => _ansi16('bright_cyan'),
        key     => _ansi16('magenta'),
        comment => _ansi16('green'),
        keyword => _ansi16('blue'),
        symbol  => _ansi16('cyan'),
        linum   => _ansi16('black', 'on_white'), # file:line number
    },
);

#use Data::Dump; dd \%THEME;

1;
# ABSTRACT: Default color theme for Data::Dump::Color (16 color)

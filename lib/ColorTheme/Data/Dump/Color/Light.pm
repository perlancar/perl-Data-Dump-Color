package ColorTheme::Data::Dump::Color::Light;

use strict;
use parent 'ColorThemeBase::Static::FromStructColors';
use Term::ANSIColor;

# AUTHORITY
# DATE
# DIST
# VERSION

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
        Regexp  => 'ddbb00',
        undef   => 'ff6666',
        number  => 'aaaaff', # floats can have different color
        float   => '00ffff',
        string  => 'ffff88',
        object  => '00ff00',
        glob    => '00dddd',
        key     => 'ff77ff',
        comment => '00cc00',
        keyword => '', # blue
        symbol  => '00dddd',
        linum   => '808080',
    },
);

#use Data::Dump; dd \%THEME;

1;
# ABSTRACT: Light color theme for Data::Dump::Color (RGB 24bit)

=head1 DESCRIPTION

Blue, red, and purple are particularly not very visible with black background
and display's lower brightness. Thus this color theme.

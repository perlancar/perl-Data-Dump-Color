use Data::Dump::Color;

open($sym, "filename");

$a = {
	'first'   => 'Jason',
	'last'    => 'Doolis',
	'int'     => 45,
	'float'   => 4.5,
	'neg'     => -4.5,
	'str_num' => "45",
	'undef'   => undef,
	'array'   => [111.1,222,333.3,444],
	'test'    => .5,
	'sym'     => $sym,
	'hash'    => { color => 'red', animal => 'kitten', age => 19 },
};

$a->{regexp} = qr/FooBar.*/;

$b = {
	'foo' => 'bar',
	'num' => 14.5,
};

dd($a);

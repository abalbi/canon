package Metodo;
use Data::Dumper;
use fields qw(_key, _code);

sub new {
	my $class = shift;
	my $key = shift;
	my $code = shift;
	my $self = bless {
		_key => $key,
		_code => $code
	}, $class;
	$self;
}


sub key {
	my $self = shift;
	return $self->{_key};
}

sub correr {
	my $self = shift;
	my $persona = shift;
	return &{$self->{_code}}($self, $persona);
}
1;
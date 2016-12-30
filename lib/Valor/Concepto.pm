package Valor::Concepto;
use Data::Dumper;
use base qw(Valor);
use Canon;

our $validos_todos  = [qw(modelo diseñador[a|] doctor[a|] psicolog[a|o] act[riz|or])];
our $validos_mujer  = [qw(secretaria)];
our $validos_hombre = [qw()];

  sub requerido { 1 }

  sub requiere { [qw(sexo)] }

  sub key { 'concepto' }

	sub validos {
		my $self = shift;
		my $persona = shift;
		my $valores;
		$valores = [@$validos_todos];
    if($persona->es('mujer')) {
    	push @{$valores}, @$validos_mujer;
  	}
    if($persona->es('hombre')) {
    	push @{$valores}, @$validos_hombre;
  	}
		return $valores;
	}

	sub es {
		my $self = shift;
		my $arg = shift;
		return $self->valor eq $arg;
	}

1;

package Valor::Sexo;
use Data::Dumper;
use base qw(Valor);
use Canon;
  sub requerido { 1 }

  sub requiere { [] }

  sub key { 'sexo' }

  sub validos {
    my $self = shift;
    my $persona = shift;
    my $valores;
    $valores = [qw(f m)];
    return $valores;
  }

  sub es {
    my $self = shift;
    my $arg = shift;
    $arg = 'f' if $arg eq 'mujer';
    $arg = 'm' if $arg eq 'hombre';
    my $boo = 0;
    $boo = 1 if $self->valor eq $arg;
    return $boo;
  }

1;

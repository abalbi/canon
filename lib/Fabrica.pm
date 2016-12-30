package Fabrica;
use Data::Dumper;

our $valores = [qw(
  Valor::Sexo
  Valor::Concepto
  Valor::Nombre
)];

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  $self;
}

sub hacer {
  my $self = shift;
  my $args = shift;
  die "\$args debe ser un HASH" if $args && ref $args ne 'HASH';
  my $persona = Persona->new;
  foreach my $clase (@$valores) {
    $clase->agregar_a($persona, $args->{$clase->key});
  }
  return $persona;
}

1;
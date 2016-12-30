package Persona;
use Data::Dumper;
our $AUTOLOAD;

  sub new {
    my $class = shift;
    my $self = bless [], $class;
    $self;
  }

  sub AUTOLOAD {
    my $metodo = $AUTOLOAD;
    my $self = shift;
    $metodo =~ s/.*:://;
    my $metodo = $self->puede($metodo);
    if($metodo) {
      $metodo->correr($self);
    } else {
      die "No se encontro el metodo $metodo\n";
    }
  }

  sub tiene {
    my $self = shift;
    my $key = shift;
    my $items = [];
    foreach my $item (@$self) {
      return 1 if $item->key eq $key;
    }
    return 0;
  }

  sub puede {
    my $self = shift;
    my $metodo = shift;
    foreach my $item (@$self) {
      if($item->isa('Metodo') && $item->key eq $metodo) {
        return $item;
      }
    }
  }

  sub es {
    my $self = shift;
    my $arg = shift;
    foreach my $valor (@$self) {
      if($valor->can('es')) {
        return 1 if $valor->es($arg);
      }
    }
    return 0;
  }

1;


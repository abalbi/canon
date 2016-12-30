package Valor;
use Data::Dumper;
use Canon;

  sub new {
    my $class = shift;
    my $valor = shift;
    my $self = bless {valor => $valor} , $class;
    $self;
  }

  sub agregar_a {
    my $self = shift;
    my $persona = shift;
    my $valor = shift;
    
    if(not defined $valor and $self->requerido) {
      $valor = $self->alguno($persona);
      die $self. " es REQUERIDO" if not defined $valor;
    }
    foreach my $atributo (@{$self->requiere}) {
      die "La persona no tiene $atributo que es requerido" if not $persona->tiene($atributo);
    }
    my $valor = $self->new($valor);
    push @$persona, $valor;
    $valor->persona($persona);
    $self->agregar_extras($persona);
  }

  sub alguno {
    my $self = shift;
    my $persona = shift;
    return Canon::azar($self->validos($persona));
  }

  sub valor {
    my $self = shift;
    return $self->{valor};
  }

  sub persona {
    my $self = shift;
    my $persona = shift;
    $self->{persona} = $persona if defined $persona;
    return $self->{persona};
  }

  sub agregar_extras {
    my $self = shift;
    my $persona = shift;
    push @$persona, Metodo->new($self->key, sub {
      my $self = shift;
      my $persona = shift;
      foreach my $valor (grep {$_->isa('Valor')} @$persona) {
        if($self->key eq $valor->key) {
          return $valor;
        }
      }
    });
  }

  sub t {
    my $self = shift;
    my $valor = Canon::t($self->valor, $self->persona->sexo->valor);
    return $valor;    
  }
  
1;

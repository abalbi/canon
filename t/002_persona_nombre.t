use strict;
use lib 'lib';
use Test::More qw(no_plan);
use Test::More::Behaviour;
use Test::Deep;
use Data::Dumper;

use Canon;

describe "Persona" => sub {
  context "CUANDO ejecuto un metodo que no existe" => sub {
    my $persona = Persona->new;
    it "ENTONCES debo recibir una excepcion" => sub {
      is $persona->tiene('no_tiene'), 0;
    };
  };
  context "CUANDO pregunto si tiene" => sub {
    my $persona = Persona->new;
    it "ENTONCES debo recibir una excepcion" => sub {
      eval {$persona->metodo_invalido};
      like $@, qr/No se encontro el metodo/;
    };
  };
  context "CUANDO tengo una persona sin sexo a la que le agrego nombre" => sub {
    my $persona = Persona->new;
    it "ENTONCES debo recibir una excepcion" => sub {
      eval {Valor::Nombre->agregar_a($persona, 'Maria');};
      like $@, qr/La persona no tiene sexo que es requerido/;
    };

  };
  context "CUANDO tengo una persona con un valor en nombre" => sub {
    my $persona = Persona->new;
    Valor::Sexo->agregar_a($persona, 'f');
    Valor::Nombre->agregar_a($persona, 'Maria');
    it "ENTONCES debe confirmarme que es esa persona" => sub {
      ok $persona->es('Maria');
    };
    it "ENTONCES debe confirmarme que es otra persona" => sub {
      is $persona->es('Juana'),0;
    };
    it "ENTONCES debo tener el nombre definido para la persona" => sub {
      is $persona->nombre, 'Maria';
    };
    it "ENTONCES debo tener entre la lista de los que tiene a nombre" => sub {
      ok $persona->tiene('nombre');
    };
  };
  context "CUANDO tengo una persona a la que le agrego un nombre sin valor" => sub {
    my $persona = Persona->new;
    Valor::Sexo->agregar_a($persona);    
    Valor::Nombre->agregar_a($persona);
    my $nombre = $persona->nombre;
    it "ENTONCES debo tener nombre para la persona" => sub {
      ok $nombre;
    };
    it "ENTONCES debe la persona ser el nombre" => sub {
      ok $persona->es($nombre);
    };
  };
};

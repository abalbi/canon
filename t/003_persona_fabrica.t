use strict;
use lib 'lib';
use Test::More qw(no_plan);
use Test::More::Behaviour;
use Test::Deep;
use Data::Dumper;

use Canon;

describe "Fabrica" => sub {
  context "CUANDO fabrico una persona al random" => sub {
    my $fabrica = Fabrica->new;
    my $persona = $fabrica->hacer;
    it "ENTONCES debo obtener una persona con sexo y nombre" => sub {
      ok $persona->tiene('sexo');
      ok $persona->tiene('nombre');
    };
  };
  context "CUANDO fabrico una persona con un sexo especifico" => sub {
    my $fabrica = Fabrica->new;
    my $persona = $fabrica->hacer({sexo => 'm'});
    it "ENTONCES debo obtener una persona con el sexo especificado" => sub {
      is $persona->sexo, 'm';
    };
  };
  context "CUANDO fabrico una persona pero con parametros erroneos" => sub {
    my $fabrica = Fabrica->new;
    it "ENTONCES debo obtener una persona con el sexo especificado" => sub {
      eval {$fabrica->hacer(sexo => 'm')};
      like $@, qr/\$args debe ser un HASH/;
    };

  }

};

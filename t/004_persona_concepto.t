use strict;
use lib 'lib';
use Test::More qw(no_plan);
use Test::More::Behaviour;
use Test::Deep;
use Data::Dumper;

use Canon;

describe "Concepto" => sub {
  context "Fabrica::hacer" => sub {
    context "CUANDO fabrico una persona al random" => sub {
      my $fabrica = Fabrica->new;
      my $persona = $fabrica->hacer({sexo => 'f'});
      it "ENTONCES debe tener una concepto" => sub {
        ok $persona->tiene('concepto');
      };
    };
    context "CUANDO fabrico una persona con un concepto" => sub {
      my $fabrica = Fabrica->new;
      my $persona = $fabrica->hacer({concepto => 'psicolog[a|o]'});
      it "ENTONCES debe tener el concepto" => sub {
        is $persona->concepto->valor, 'psicolog[a|o]';
      };
    };
  };
  context "Concepto::validos" => sub {
    context "CUANDO pido los validos para un mujer" => sub {
      my $fabrica = Fabrica->new;
      my $persona = $fabrica->hacer({sexo => 'f'});
      my $concepto = Valor::Concepto->new;
      it "ENTONCES debe los validos deben incluir los de mujer" => sub {
        cmp_deeply $concepto->validos($persona), supersetof(@{$Valor::Concepto::validos_todos});
        cmp_deeply $concepto->validos($persona), supersetof(@{$Valor::Concepto::validos_mujer});
      };
    };
  };
  context "Concepto::validos" => sub {
    context "CUANDO pido los validos para un hombre" => sub {
      my $fabrica = Fabrica->new;
      my $persona = $fabrica->hacer({sexo => 'm'});
      my $concepto = Valor::Concepto->new;
      it "ENTONCES debe los validos deben incluir los de hombre" => sub {
        cmp_deeply $concepto->validos($persona), supersetof(@{$Valor::Concepto::validos_todos});
        cmp_deeply $concepto->validos($persona), supersetof(@{$Valor::Concepto::validos_hombre});
      };
    };
  };
  context "Concepto::t" => sub {
    context "CUANDO fabrico una persona con un concepto y un sexo" => sub {
      my $fabrica = Fabrica->new;
      my $persona = $fabrica->hacer({sexo => 'f', concepto => 'psicolog[a|o]'});
      it "ENTONCES debe tener el concepto" => sub {
        ok $persona->es('mujer');
        is $persona->concepto->valor, 'psicolog[a|o]';
        is $persona->concepto->t, 'psicologa';
        ok $persona->es('psicolog[a|o]');
      };
    };
  };
};

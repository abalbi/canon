package Canon;
use strict;
use Data::Dumper;
use lib 'lib';
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(azar);

use Fabrica;
use Metodo;
use Persona;
use Valor;
use Valor::Nombre;
use Valor::Concepto;
use Valor::Sexo;


our $srand = 24170986;
our $srand_asignado = 0;
our $random = 0;

sub canon_srand {
  if(!$srand_asignado) {
    srand($srand);
    $srand_asignado = 1;
  }
  return $srand;
}


sub azar {
	my $valor = shift;
  canon_srand();
	return $valor->[int rand scalar @$valor] if ref $valor eq 'ARRAY'; 
	return int rand $valor + 1 if $valor =~ /^\d+$/;
	return undef;
}

sub t {
  my $valor = shift;
  my $sexo = shift;
  my $str = $valor;
  $str =~ /\[(\w*)\|(\w*)\]/;
  if(defined $sexo) {
    my $r;
    $r = $1 if $sexo eq 'f';
    $r = $2 if $sexo eq 'm';
    $str =~ s/\[\w*\|\w*\]/$r/;
    return $str;
  }
  return $valor;
}
1;
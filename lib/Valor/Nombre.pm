package Valor::Nombre;
use Data::Dumper;
use base qw(Valor);
use Canon;

our $validos_mujer  = [qw(Lucia Maria Martina Paula Daniela Sofia Valeria Carla Sara Alba Julia Noa Emma Claudia Carmen Marta Valentina Irene Adriana Ana Laura Elena Alejandra Ines Marina Vera Candela Laia Ariadna Lola Andrea Rocio Angela Vega Nora Jimena Blanca Alicia Clara Olivia Celia Alma Eva Elsa Leyre Natalia Victoria Isabel Cristina Lara Abril Triana Nuria Aroa Carolina Manuela Chloe Mia Mar Gabriela Mara Africa Iria Naia Helena Paola Noelia Nahia Miriam Salma)];
our $validos_hombre = [qw(Hugo Daniel Pablo Alejandro Alvaro Adrian David Martin Mario Diego Javier Manuel Lucas Nicolas Marcos Leo Sergio Mateo Izan Alex Iker Marc Jorge Carlos Miguel Antonio Angel Gonzalo Juan Ivan Eric Ruben Samuel Hector Victor Enzo Jose Gabriel Bruno Dario Raul Adam Guillermo Francisco Aaron Jesus Oliver Joel Aitor Pedro Rodrigo Erik Marco Alberto Pau Jaime Asier Luis Rafael Mohamed Dylan Marti Ian Pol Ismael Oscar Andres Alonso Biel Rayan Jan Fernando Thiago Arnau Cristian Gael Ignacio Joan)];

	sub requerido { 1 }

  sub requiere { [qw(sexo)] }

  sub key { 'nombre' }

	sub validos {
		my $self = shift;
		my $persona = shift;
		my $valores;
    if($persona->es('mujer')) {
    	$valores = $validos_mujer;
  	} else {
    	$valores = $validos_hombre;
  	}
		return $valores;
	}

	sub es {
		my $self = shift;
		my $arg = shift;
		return $self->valor eq $arg;
	}

1;

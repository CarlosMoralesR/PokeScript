#! /usr/bin/bash

if [ $# -eq 0 ]
then
	echo "No hay ningún parámetro"
else

	pokemon="${1,,?}"
	if [ "$pokejson" == "Not Found" ]
	then
		echo "Nombre de pokemon incorrecto"
	else
		# agregar parseo con jq
		pokejson=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon)
		id=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon | jq .id)
		name=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon | jq .name)
		weight=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon | jq .weight)
		height=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon | jq .height)
		order=$(curl https://pokeapi.co/api/v2/pokemon/$pokemon | jq .order)
		clear
		echo "Id: $id, name: $name, weight: $weight, height: $height, order: $order"
	fi
fi

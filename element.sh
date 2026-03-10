#!/bin/bash

[[ $# -ne 1 ]] && echo "Please provide an element as an argument." && exit

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

BASEQUERY="SELECT properties.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id"

ERROR=0

if [[ $1 =~ ^[0-9]+$ ]]; then
	# Query by atomic_number
	QUERY="$BASEQUERY WHERE properties.atomic_number = ${1}"
	RESULT=$($PSQL "$QUERY")

	if [[ -z $RESULT ]]; then
		ERROR=1
	else
		IFS='|'
		read -a RESULTARRAY <<< "$RESULT"
	fi 
else
	QUERY="$BASEQUERY WHERE elements.symbol = '${1}' OR elements.name = '${1}'"
	RESULT=$($PSQL "$QUERY")

	if [[ -z $RESULT ]]; then
		ERROR=1
	else
		IFS='|'
		read -a RESULTARRAY <<< "$RESULT"
	fi
fi

if [[ $ERROR -eq 1 ]]; then
	echo "I could not find that element in the database." && exit
fi

echo "The element with atomic number ${RESULTARRAY[0]} is ${RESULTARRAY[1]} (${RESULTARRAY[2]}). It's a ${RESULTARRAY[3]}, with a mass of ${RESULTARRAY[4]} amu. ${RESULTARRAY[1]} has a melting point of ${RESULTARRAY[5]} celsius and a boiling point of ${RESULTARRAY[6]} celsius."

exit 0

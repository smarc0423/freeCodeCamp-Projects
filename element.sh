#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#If no input is provided: 
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi
 
#check if the argument provided is an atomic number: 
if [[ $1 =~ ^[1-9]+$ ]]
then
  RES=$($PSQL " SELECT atomic_number, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE atomic_number = $1 ")

#If not a number, then it must be a string:
else
  RES=$($PSQL " SELECT atomic_number, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE name = '$1' OR symbol = '$1' ")

fi

#If element not found:
if [[ -z $RES ]]
then
  echo "I could not find that element in the database."
  exit
fi
 
echo $RES | while IFS=" |" read NUMBER TYPE MASS MELT BOIL SYMBOL NAME
do
  echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done

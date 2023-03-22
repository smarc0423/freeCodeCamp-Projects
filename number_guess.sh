#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=user_db -t --no-align -c"

#user name enter
echo "Enter your username:"
read USERNAME
#check in db
URES=$($PSQL "select * from users where username='$USERNAME'")
#if not, create
if [[ -z $URES ]]
then
  $($PSQL "insert into users(username, best_game, games_played) values('$USERNAME',0,0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "$URES"| while IFS="|" read UNAME PLAYED BEST
  do
    echo "Welcome back, $UNAME! You have played $PLAYED games, and your best game took $BEST guesses."
  done
fi
PLAYED=$($PSQL "select games_played from users where username='$USERNAME'")
BEST=$($PSQL "select best_game from users where username='$USERNAME'")
#prompt guess
GUESS_COUNTER=1
ANS=$(( $RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

#while !=ans,

read GUESS
while [[ $GUESS != $ANS ]]
do
  #track guess, give ans
  GUESS_COUNTER=$(( $GUESS_COUNTER+1 ))
  #high/low check
  if [[ ! $GUESS =~ ^[0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS -lt $ANS ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
  elif [[ $GUESS -gt $ANS ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
  fi
done

PLAYED=$(( $PLAYED+1 ))
if [[ $GUESS_COUNTER -lt $BEST || $BEST == 0 ]]
then
  $($PSQL "update users set best_game=$GUESS_COUNTER where username='$USERNAME'")
else
  $($PSQL "update users set best_game=$BEST where username='$USERNAME'")
fi
$($PSQL "update users set games_played=$PLAYED where username='$USERNAME'")

echo "You guessed it in $GUESS_COUNTER tries. The secret number was $ANS. Nice job!"

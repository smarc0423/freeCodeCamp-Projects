#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# team insert
echo $($PSQL "TRUNCATE table teams, games;")
echo $($PSQL "alter sequence teams_team_id_seq restart with 1;")
echo $($PSQL "alter sequence games_game_id_seq restart with 1;")
cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_G OPP_G 
do
  #get team_id
  if [[ $WIN != "winner" ]]
    then
    TEAM_ID=$($PSQL "SELECT TEAM_ID FROM TEAMS where name='$WIN'")
    if [[ -z $TEAM_ID ]]
      then
        echo $($PSQL "INSERT into teams(name) values ('$WIN')")
        #echo inserted $WIN
      fi
      TEAM_ID=$($PSQL "SELECT TEAM_ID FROM TEAMS where name='$WIN'")
  fi
  if [[ $OPP != "opponent" ]]
  then
    TEAM_ID=$($PSQL "SELECT TEAM_ID FROM TEAMS where name='$OPP'")
    if [[ -z $TEAM_ID ]]
      then
        echo $($PSQL "INSERT into teams(name) values ('$OPP')")
        #echo inserted $OPP
      fi
      TEAM_ID=$($PSQL "SELECT TEAM_ID FROM TEAMS where name='$OPP'")
  fi
  #do game id
  if [[ $YEAR != "year" ]]
  then
    WIN_ID=$($PSQL "select team_id from teams where name='$WIN'")
    OPP_ID=$($PSQL "select team_id from teams where name='$OPP'")
    echo $($PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values ($YEAR, '$ROUND', $WIN_G, $OPP_G, $WIN_ID, $OPP_ID)")
  fi
done

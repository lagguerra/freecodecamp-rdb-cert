#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

GAMES_FILE=games.csv
WINNER_HEADER=winner
OPPONENT_HEADER=opponent

# Get teams
WINNERS=$(cut -d "," -f 3 $GAMES_FILE | grep -v $WINNER_HEADER)
OPPONENTS=$(cut -d "," -f 4 $GAMES_FILE | grep -v $OPPONENT_HEADER)
TEAMS=$(echo -e "$OPPONENTS\n$WINNERS" | sort | uniq)

# Clean tables on execution
$PSQL "TRUNCATE games, teams"

# Add teams to teams table
echo -e "$TEAMS" | while read team
do
	$PSQL "INSERT INTO teams(name) VALUES('$team')"
done

# Add games to games table
while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	# Skip header row
	[[ $YEAR == "year" ]] && continue
	# Get winner id
	WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
	# Get opponent id
	OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
	$PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
done < "$GAMES_FILE"


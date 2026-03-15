#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USERNAME=""
NAME_LENGHT=0

GET_USERNAME() {
	echo "Enter your username:"
	read USERNAME
	NAME_LENGHT=${#USERNAME}
}

until [[ ${NAME_LENGHT} -gt 0 ]] && [[ ${NAME_LENGHT} -le 22 ]]; do
	GET_USERNAME
done

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

if [[ -z ${USER_ID} ]]; then
	echo "Welcome, ${USERNAME}! It looks like this is your first time here."
	DB_INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
	GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = '$USER_ID'")
	BEST_GUESS=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = '$USER_ID'")
	echo "Welcome back, ${USERNAME}! You have played ${GAMES_PLAYED} games, and your best game took ${BEST_GUESS} guesses."
fi

SECRET_NUMBER=$((1 + $RANDOM % 1000))
TRIES=0
GUESS=0

echo "Guess the secret number between 1 and 1000:"

until [[ ${GUESS} -eq ${SECRET_NUMBER} ]]; do
	read GUESS
	TRIES=$((${TRIES} + 1))
	if [[ ! ${GUESS} =~ ^[0-9]+$  ]]; then
		echo "That is not an integer, guess again:"
	elif [[ ${GUESS} -gt ${SECRET_NUMBER} ]]; then
		echo "It's lower than that, guess again:"
	elif [[ ${GUESS} -lt ${SECRET_NUMBER} ]]; then
		echo "It's higher than that, guess again:" 
	fi
done

DB_INSERT_GUESS=$($PSQL "INSERT INTO games(guesses, user_id) VALUES('${TRIES}', '${USER_ID}')")

echo "You guessed it in ${TRIES} tries. The secret number was ${SECRET_NUMBER}. Nice job!"

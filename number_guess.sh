#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=numguess -t --no-align -c"
echo -e "\n~~~~ NUMBER GUESS GAME ~~~~"
TARGET=$(($RANDOM % 1000 +1))
echo -e "\nEnter your username:"
read USERNAME
USER_NAME=$($PSQL "SELECT username from games WHERE username='$USERNAME' ")
if [[ -z $USER_NAME ]]
then
echo Welcome, $USERNAME! It looks like this is your first time here.
NEW_USER=$($PSQL "INSERT INTO games(username) VALUES('$USERNAME')")
fi
echo -e "\nGuess the secret number between 1 and 1000:"
read guess

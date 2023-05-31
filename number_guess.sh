#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "~~~~ NUMBER GUESS GAME ~~~~"
TARGET=$(($RANDOM % 1000 +1))
#echo $TARGET
TRY=0
echo -e "Enter your username:"
read USERNAME
USER_NAME=$($PSQL "SELECT username from games WHERE username='$USERNAME' ")
if [[ -z $USER_NAME ]]
then
echo Welcome, $USERNAME! It looks like this is your first time here.
NEW_USER=$($PSQL "INSERT INTO games(username) VALUES('$USERNAME')")
else
OLD_TRIES=$($PSQL "SELECT MIN(guesses) FROM time WHERE username='$USERNAME'")
OLD_GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
echo "Welcome back, $USERNAME! You have played $OLD_GAMES_PLAYED games, and your best game took $OLD_TRIES guesses."
fi
echo -e "Guess the secret number between 1 and 1000:"
read GUESS
while [[ $GUESS -ne $TARGET ]]
do 
if [[ $GUESS =~ ^[0-9]*$ ]]
then
 (( TRY++ ))
 #echo $TRY
 if [[ $GUESS -gt $TARGET ]]
 then
 echo -e "It's lower than that, guess again:"
 fi
 if [[ $GUESS -lt $TARGET ]]
 then
 echo -e "It's higher than that, guess again:"
 fi
 read GUESS
 
else
  echo -e "That is not an integer, guess again:"
  read GUESS
fi
done
(( TRY++ ))
echo -e "You guessed it in $TRY tries. The secret number was $TARGET. Nice job!"
UPDATE_TIMES=$($PSQL "INSERT INTO time(username,guesses) VALUES('$USERNAME','$TRY')")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
(( GAMES_PLAYED++ ))
UPDATE_GAMES=$($PSQL "UPDATE games SET games_played='$GAMES_PLAYED'")


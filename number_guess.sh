#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
echo -e "\n~~~~ NUMBER GUESS GAME ~~~~"
TARGET= $(($RANDOM % 1000 +1))
echo -e "\nEnter your username:"
read USERNAME
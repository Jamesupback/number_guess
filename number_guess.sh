#!/bin/bash
echo -e "\n~~~~ NUMBER GUESS GAME ~~~~"
TARGET= $(($RANDOM % 1000 +1))
echo -e "\nEnter your username:"
read USERNAME
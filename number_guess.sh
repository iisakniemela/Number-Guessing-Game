#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

LOGIN_SCREEN () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nEnter your username:"
  read USERNAME
  if [[ ${#USERNAME} -lt 4 ]]
  then 
    LOGIN_SCREEN "\nUsername has to be at least 4 characters"
    return
  fi
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
  if [[ -z $USER_ID ]]
  then
    echo -e "\nWelcome, $(echo $USERNAME | sed -E 's/^ *| *$//g')! It looks like this is your first time here."
    ADD_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
    GAME "$USER_ID" "$USERNAME" "0" "0"
    return
  fi
  USER_INFORMATION=$($PSQL "SELECT games_played, best_game FROM users WHERE user_id = $USER_ID")
  IFS="|" read -r GAMES_PLAYED BEST_NUMBER_GUESSES <<< $USER_INFORMATION
  echo -e "\nWelcome back, $(echo $USERNAME | sed -E 's/^ *| *$//g')! You have played $(echo $GAMES_PLAYED | sed -E 's/^ *| *$//g') games, and your best game took $(echo $BEST_NUMBER_GUESSES | sed -E 's/^ *| *$//g') guesses."
  GAME "$USER_ID" "$USERNAME" "$GAMES_PLAYED" "$BEST_NUMBER_GUESSES"
}
GAME () {
  USER_ID=$1
  USERNAME=$2
  GAMES_PLAYED=$3
  BEST_NUMBER_GUESSES=$4
  GUESSES=0 
  NUMBER_TO_GUESS=$(( $RANDOM % 1000 + 1 ))
  echo -e "\nGuess the secret number between 1 and 1000:"
  while true
  do
    let "GUESSES++"
    read NUMBER
    if [[ ! $NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      continue
    fi
    if [[ $NUMBER -gt $NUMBER_TO_GUESS ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      continue
    fi
    if [[ $NUMBER -lt $NUMBER_TO_GUESS ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      continue
    fi
    echo -e "\nYou guessed it in $(echo $GUESSES | sed -E 's/^ *| *$//g') tries. The secret number was $(echo $NUMBER_TO_GUESS | sed -E 's/^ *| *$//g'). Nice job!"
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_ID, $GUESSES)")
    if [[ $GAMES_PLAYED = 0 ]] || [[ $GUESSES -lt $BEST_NUMBER_GUESSES ]]
    then
      UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE user_id = $USER_ID")
    fi
    INCREMENT_NUMBER_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
    break
  done
}
LOGIN_SCREEN "~~~~ Welcome to the number guessing game ~~~~"

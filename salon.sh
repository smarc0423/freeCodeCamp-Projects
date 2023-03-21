#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo welcome
SERVICE_ID_SELECTED='a'
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nchoose"

  echo "$($PSQL "select service_id, name from services")"| while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) PHONE ;;
    2) PHONE ;;
    3) PHONE ;;
    *) MAIN_MENU "Enter valid number"
  esac
}

PHONE(){
  echo -e "\ngive phone number"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo enter name
    read CUSTOMER_NAME
    C_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")


  echo hour
  read SERVICE_TIME
  RESULT=$($PSQL "insert into appointments(service_id, customer_id, time) values($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
  if [[ $RESULT == 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    exit
  else
    echo error
  fi
  
}

MAIN_MENU

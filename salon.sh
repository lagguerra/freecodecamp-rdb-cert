#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT * FROM services")

DISPLAY_SERVICES() {
	echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
	do
		echo "$SERVICE_ID) $SERVICE"
	done
}

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
	DISPLAY_SERVICES
	MAKE_APPOINTMENT
}

MAKE_APPOINTMENT() {
	read SERVICE_ID_SELECTED
	if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
		echo -e "\nI could not find that service. What would you like today?"
		MAIN_MENU
	else
		# get service name
		SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
		echo -e "\nWhat's your phone number?"
		read CUSTOMER_PHONE
		CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
		if [[ -z $CUSTOMER_NAME ]]; then
			echo -e "\nI don't have a record for that phone number, what's your name?"
			read CUSTOMER_NAME
			INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
			CUSTOMER_NAME=" "$CUSTOMER_NAME
		fi
		echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
		read SERVICE_TIME
		# get customer_id
		CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
		INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
		echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
	fi
}

MAIN_MENU

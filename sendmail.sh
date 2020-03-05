#!/usr/bin/env bash

i=0
DATA=sample.csv
SMTP=$INPUT_SMTP
USER=$INPUT_USER
PASSWORD=$INPUT_PASSWORD
KURS="13.663,70"
OLDIFS=$IFS
IFS=';'
[ ! -f $DATA ] &&  { echo "$DATA [file not found]"; exit 99; }
while read id name cloud_id owner programmer own_email usd email_cc
do
	if (( $i > 0 ))
	then
		ID=$(echo "$id" | cut -d '"' -f 2)
		PROJECT_NAME=$(echo "$name" | cut -d '"' -f 2)
		PROJECT_ID=$(echo "$cloud_id" | cut -d'"' -f 2)
		PROGRAMER=$(echo "$programmer" | cut -d '"' -f 2)
		COST_USD=$(echo "$usd" | cut -d'"' -f 2)
		EMAILS=$(echo "$own_email " | cut -d'"' -f 2 )
		CC=$(echo "$email_cc" | cut -d'"' -f 2)

		SUBJECT="Server Budget Report ${ID}"

		cp email_template.txt email-content.txt
		sed -i "s/\[PIC_NAME\]/$PROJECT_NAME/g" email-content.txt
  		sed -i "s/\[PROJECT_ID\]/$PROJECT_ID/g" email-content.txt
  		sed -i "s/\[QUEST_ID\]/$ID/g" email-content.txt
  		sed -i "s/\[COST_USD\]/$COST_USD/g" email-content.txt
  		sed -i "s/\[KURS\]/$KURS/g" email-content.txt
  		
  		MESSAGE=$(cat email-content.txt)
		sendEmail -o tls=yes -f ${]USER} -t ${EMAILS} -cc ${CC} -s ${SMTP} -xu ${USER} -xp ${PASSWORD} \
		-u ${SUBJECT} -m "${MESSAGE}"

		rm email-content.txt

		echo "email sending to ${ID}"
	fi
	i=$(( $i + 1 ))
done < $DATA
IFS=$OLDIFS

echo "done"
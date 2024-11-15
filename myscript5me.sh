
#!/bin/bash

#-3-Systems_functions

clear

echo -e "What would you like to see?
Today's date (d)
Currently logged in users (u)
The contents of the / directory (r)
Network Test (n)
Exit this script (x)

Enter your choice(d/u/r/x)-->\c"
read ANSWER
if  [ $ANSWER = "d" -o $ANSWER = "D" ]
then
	clear
	echo -e "Today's date is: \c"
	date
	echo
	echo
elif [ $ANSWER = "u" -o $ANSWER = "U" ]
then
	clear
	echo -e "\nThe people logged into the system include:"
	who
	echo
	echo
elif [ $ANSWER = 'r' -o $ANSWER = "R" ]
then
	clear
	echo -e "\nThe contents of the / directory are:"
	ls -F /
	echo
	echo
elif [ $ANSWER = "x" -o $ANSWER = "X" ]
then
	clear
	echo -e "\nHasta la vista, Baby"
	echo
	echo


elif [ $ANSWER = "n" -o $ANSWER = "N" ]
then
	clear
	echo -e "Preparing to run 3 Phase Network test \n Phase 1: Loopback Ping \n Phase 2: Basic Network Test \n Phase 3: DNS Test "
	echo
	echo -e "Press \e[31m^c\e[0m at any time to end"
	echo 
	sleep 7
	clear

	ping -c 5 127.0.0.1 
	echo
	echo "\nResults are in"
	sleep 5
	clear 

	echo -e "Phase 1 complete"
	sleep 5
	clear

	ping -c 5 8.8.8.8
	echo 
        echo "\nResults are in"
	sleep 5 
	clear 

	echo -e	"Phase 2 complete"
        sleep 4
        clear

	ping -c 5 google.com
	echo 
        echo "\nResults are in"
	sleep 4
	clear

	echo -e	"Phase 3 complete"
        sleep 4
        clear

	echo -e " Network test completed"
	echo -e "\n I hope you payed attention"
	sleep 5  
	clear

	echo -e "\n This program will now close"
	sleep 2
	clear
	echo -e "\e[32mGoodBye\e[0m"
	sleep 2
	clear

else
	clear
	echo -e " \e[31m$ANSWER\e[0m is not one of the choices,Hold on while I bring up the menu"
	sleep 7
	myscript5c
fi

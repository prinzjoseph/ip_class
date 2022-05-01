#!/bin/bash
#Author: prinzjoseph
#Script to determine whether the User input is a valid IP or not.
#Also determines the Class of the IP, whether it is a Private or Public IP.

printf "\e[1;92m  ___ ____     ____ _        _    ____ ____   \e[0m\n"
printf "\e[1;92m |_ _|  _ \   / ___| |      / \  / ___/ ___|  \e[0m\n"
printf "\e[1;92m  | || |_) | | |   | |     / _ \ \___ \___ \  \e[0m\n"
printf "\e[1;92m  | ||  __/  | |___| |___ / ___ \ ___) |__) | \e[0m\n"
printf "\e[1;92m |___|_|      \____|_____/_/   \_\____/____/  \e[0m\n"
                                           
echo "Please enter a valid IP:"
read IP
A=(${IP//./ })

#Check if valid IP
if [[ ${#A[@]}=4 && ${A[0]} -gt 0 && ${A[0]} -le 255  && ${A[1]} -ge 0 && ${A[1]} -le 255 && ${A[2]} -ge 0 && ${A[2]} -le 255 && ${A[3]} -ge 0 && ${A[3]} -le 255 ]] 
then
	echo "$IP is a Valid IP."
       
       	#Check if Class A
	if [[ ${A[0]} -gt 0 && ${A[0]} -le 127 ]]
        then
		echo "$IP is a Class A IP."
	        
		#Check if Localhost/Private
		if [[ ${A[0]} = 127 && ${A[1]} = 0 && ${A[2]} = 0 && ${A[3]} = 1 ]]
		then
			echo "It is you!"
		elif [[ ${A[0]} = 10 ]]
		then
			echo "It is a Class A Private IP."
		else
			echo "It is a Class A Public IP."
		fi
	
        #Check if Class B
	elif [[ ${A[0]} -ge 128 && ${A[0]} -le 191 ]]
	then
		echo "$IP is a Class B IP."
 
		#Check if Private
		if [[ ${A[0]} -eq 172  && ${A[1]} -ge 16 && ${A[1]} -le 31 ]]
		then
			echo "It is a Class B private IP."
		else
			echo "It is a Class B public IP."
		fi

	#Check if Class C
	elif [[ ${A[0]} -ge 192 && ${A[0]} -le 223 ]]
	then
		echo "$IP is a Class C IP."
                
		#Check if Private
		if [[ ${A[0]} -eq 192 && ${A[1]} -eq 168 ]]
		then
			echo "It is a Class C private IP."
		else
			echo "It is a Class C public IP."
		fi

	#Check if Class D
	elif [[ ${A[0]} -ge 224 && ${A[0]} -le 239 ]]
	then
		echo "$IP is a Class D IP."

	#Check if Class E
	elif [[ ${A[0]} -ge 240 && ${A[0]} -le 255 ]]
	then
		echo "$IP is a Class E IP."
	fi
else
	echo "***** Warning! Not a valid IP. *****"
	exit 0
fi



#!/usr/bin/bash

function show_options_menu(){
	echo "1) List the content of a folder"
	echo "2) Create a text file with a line inserted by the user"
	echo "3) Compare two given text files"
	echo "4) Show the function of AWK command (returns the fifth and tenth word of every line)"
	echo "5) Show the function of 'grep' command (searches for a word in supernova.txt)"
	echo "6) Exit program"
}

function welcome_message(){
	echo "Welcome to this program. Below is a menu to select options. Please enter the corresponding number."
}

function menu_actions(){
	local option=$1
	
	case $option in 
		1) 
			read -p "Please insert the absolute path of the folder to list its content: " folder
			if [ -d "$folder" ]; then
				echo "This is the content of the folder you inserted:"
				ls "$folder"
			else
				echo "The folder does not exist."
			fi
			;;
		2)
			read -p "Please insert a line of text to insert it into a new file: " line
			read -p "Please insert the name of the file: " file
			touch "$file.txt"
			echo "$line" > "$file.txt"
			echo "Your file was successfully created."
			;;

		3) 	
			echo "Note: If the files are identical, this will return nothing. If there are differences, it will output the lines that differ."
			read -p "Please insert the absolute path of the first file: " first_file
			read -p "Please insert the absolute path of the second file: " second_file
			if [ -f "$first_file" ] && [ -f "$second_file" ]; then
				diff "$first_file" "$second_file"
			else
				echo "One or both of the files do not exist."
			fi
			;;
		4)
			read -p "Please insert the absolute path of the file: " return_words_file
			if [ -f "$return_words_file" ]; then
				awk '{print $5, $10}' "$return_words_file"
			else
				echo "The specified file does not exist."
			fi
			;;

		5) 
			read -p "Please insert the word to be found in supernova.txt: " word
			if [ -f "supernova.txt" ]; then
				grep "$word" supernova.txt
			else
				echo "The file supernova.txt does not exist."
			fi
			;;

		6)     
			exit 0
			;;
		*) 
			echo "Please select a valid option."
			;;
	esac
}

# Inicializa 'option' con un valor numérico predeterminado
option=0
welcome_message

# Bucle while mejorado para aceptar solo números
while [[ "$option" != "6" ]]; do
	show_options_menu
	read -p "Please select an option: " option
	
	# Verifica si la entrada es un número válido
	if [[ "$option" =~ ^[1-6]$ ]]; then
		menu_actions "$option"
	else
		echo "Please select a valid option (1-6)."
	fi
done

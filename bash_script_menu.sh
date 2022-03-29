#!/bin/bash
# Author: Herrera, Franco Nahuel

######################
#Construir un aplicativo shell que despliegue un menú con varias opciones, así:
#MENÚ PRINCIPAL
#1. Copiar/Mover archivos
#2. Reporte archivo
#3. Buscar una palabra en archivos
#4. Salir
#El menú siempre estará activo, es decir, el programa no terminará hasta que 
#el usuario seleccione la
#opción de 4. Salir (y luego confirme que desea salir). Esto significa que si 
#el usuario elige otra opción,
#después de que acabe lo que sea en esa otra opción, debe regresar al 
#menú principal.
######################

######################
#Opción 1: Copiar/Mover archivos
#El programa preguntará (leerá) si desea Copiar o Mover, y luego solicitará (leerá) el origen (ruta y
#archivo) y el destino (ruta y archivo).
######################

function copy_option_es()
{
	read -p "Ingrese la ruta de archivo:" FILE
	if [ ! -e $FILE ]
	then
		echo "El archivo no existe."
		read -p "Ingrese el nombre de archivo seguido de la extensión:" FILE
		nano $FILE
		copy_option_es
	fi
	read -p "Ingrese la ruta de carpeta destino:" FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "La carpeta no existe."
		read -p "Ingrese el nombre de carpeta:" FOLDER
		mkdir $FOLDER
		copy_option_es
	fi
	cp $FILE $FOLDER
	if [ "$?" -eq "0" ]
	then
		echo "La operación fue exitosa"
		spanish_menu
	else
	
		echo "La operación no se pudo completar."
	fi

	spanish_menu
}

function copy_option_en()
{
	read -p "Enter the file path:" FILE
	if [ ! -e $FILE ]
	then
		echo "File does not exist."
		read -p "Enter the file name followed by the file extension:" FILE
		nano $FILE
		copy_option_en
	fi
	read -p "Enter the destination folder path:" FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "Folder does not exist."
		read -p "Enter the folder path:" FOLDER
		mkdir $FOLDER
		copy_option_en
	fi
	cp $FILE $FOLDER
	if [ "$?" -eq "0" ]
	then
		echo "The operation was successful"
		english_menu
	else
	
		echo "The operation could not be completed."
	fi

	english_menu
}

function paste_option_es()
{
	read -p "Ingrese la ruta de archivo:" FILE
	if [ ! -e $FILE ]
	then
		echo "El archivo no existe."
		read -p "Ingrese el nombre de archivo seguido de la extensión:" FILE
		nano $FILE
		paste_option_es
	fi
	read -p "Ingrese la ruta de carpeta destino:" FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "La carpeta no existe."
		read -p "Ingrese el nombre de carpeta:" FOLDER
		mkdir $FOLDER
		paste_option_es
	fi
	mv $FILE $FOLDER
	if [ "$?" -eq "0" ]
	then
		echo "La operación fue exitosa"
		spanish_menu
	else
	
		echo "La operación no se pudo completar."
	fi

	spanish_menu
}

function paste_option_en()
{
	read -p "Enter the file path:" FILE
	if [ ! -e $FILE ]
	then
		echo "File does not exist."
		read -p "Enter the file name followed by the file extension:" FILE
		nano $FILE
		paste_option_en
	fi
	read -p "Enter the destination folder path:" FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "Folder does not exist."
		read -p "Enter the folder path:" FOLDER
		mkdir $FOLDER
		paste_option_en
	fi
	mv $FILE $FOLDER
	if [ "$?" -eq "0" ]
	then
		echo "The operation was successful"
		english_menu
	else
	
		echo "The operation could not be completed."
	fi

	english_menu
}

function first_option_es()
{
	echo "##################"
	echo "¿Qué desea hacer"
	echo "1. Copiar archivos"
	echo "2. Mover Archivos"
	echo "#################"
	read -p "Ingrese la opción:" OPTION
	clear
	case $OPTION in
	1)copy_option_es;;
	2)paste_option_es;;
	*)echo "Opción inválida"; 
	first_option_es
	esac
	spanish_menu
}

function first_option_en()
{
	echo "################"
	echo "What do you want to do?"
	echo "1. Copy file"
	echo "2. Move file"
	echo "###############"
	read -p "Enter your answer:" OPTION
	clear
	case $OPTION in
	1)copy_option_en;;
	2)paste_option_en;;
	*)echo "Wrong Answer!";
	first_option_en
	esac
	english_menu
}

###################
#Opción 2: Reporte archivo
#El programa preguntará (leerá) el archivo (incluyendo ruta). Validará 
#si existe o no (en cuyo caso desplegará el error), pero si existe, 
#entonces hará un reporte de varias características propias del archivo
#como: nombre, ruta, tamaño (bytes), permisos (Ej: drwxr-xr-x), fechas del archivo, 
#cantidad de líneas y cantidad de palabras.
###################

function second_option_es()
{
	read -p "Ingrese la ruta de archivo:" FILE
	if [ ! -e $FILE ]
	then
		echo "El archivo no existe."
		read -p "Ingrese el nombre de archivo seguido de la extensión:" FILE
		nano $FILE
		second_option_es
	else
		
		NAME=$(basename $FILE)
		ROWS=$(wc -l $FILE | awk '{print $1}')
		WORDS=$(wc -w $FILE | awk '{print $1}')
		ROUTE=$(realpath $FILE)
		PERMISSIONS=$(ls -l $FILE | awk '{print$1}')
		SIZE=$(ls -l $FILE | awk '{print$5}')
		CREATION=$(date -r $FILE "+%d-%m-%Y %H:%M:%S")
		echo "Ruta: $ROUTE"
		echo "Nombre: $NAME"
		echo "Permisos: $PERMISSIONS"
		echo "Tamaño: $SIZE"
		echo "Ultima Modificación: $CREATION"
		echo "Cantidad de palabras: $WORDS"
		echo "Cantidad de renglones: $ROWS"
		spanish_menu
	fi
}

function second_option_en()
{
	read -p "Enter the file path:" FILE
	if [ ! -e $FILE ]
	then
		echo "File does not exist."
		read -p "Enter the file name followed by the file extension:" FILE
		nano $FILE
		second_option_en
	else
	
		NAME=$(basename $FILE)
		ROWS=$(wc -l $FILE | awk '{print $1}')
		WORDS=$(wc -w $FILE | awk '{print $1}')
		ROUTE=$(realpath $FILE)
		PERMISSIONS=$(ls -l $FILE | awk '{print$1}')
		SIZE=$(ls -l $FILE | awk '{print$5}')
		CREATION=$(date -r $FILE "+%Y-%m-%d %H:%M:%S")
		echo "Path: $ROUTE"
		echo "Name: $NAME"
		echo "Permissions: $PERMISSIONS"
		echo "Size: $SIZE"
		echo "Last Change: $CREATION"
		echo "Word count: $WORDS"
		echo "Row count: $ROWS"
		english_menu
	fi
}

###############
#Opción 3: Buscar una palabra en archivos
#El programa capturará (leerá) la palabra a buscar y la ruta base 
#a partir de la cual buscará de forma
#recursiva, y guardará en un archivo el resultado de la búsqueda. 
#El archivo tendrá el nombre
#results_YYYYMMDD_HH24MISS.txt, donde YYYYMMDD corresponde a la fecha del sistema y
#HH24MISS corresponde a la hora formato 24 (con minutos y segundos) del sistema, 
#al momento de ejecutar la búsqueda.
###############

function third_option_es()
{
	read -p "Ingrese la palabra: " WORD
	read -p "Ingrese el directorio: " FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "La carpeta no existe."
		read -p "Ingrese el nombre de carpeta:" FOLDER
		mkdir $FOLDER
		third_option_es
	fi
	DATE=$(date +"%d%m%Y")
	HOUR=$(date +"%H%M%S")
	ARR=$(ls $FOLDER)
	for item in ${ARR[@]}
	do
        	grep $WORD $item > results_${DATE}_${HOUR}.txt
	done
	if [ "$?" -eq "0" ]
	then
		echo "La operación fue exitosa"
		spanish_menu
	else
	
		echo "La operación no se pudo completar."
	fi

	spanish_menu
}

function third_option_en()
{
	read -p "Enter the word: " WORD
	read -p "Enter the folder: " FOLDER
	if [ ! -d $FOLDER ]
	then
		echo "The folder does not exist."
		read -p "Enter the folder name:" FOLDER
		mkdir $FOLDER
		third_option_en
	fi
	DATE=$(date +"%Y%m%d")
	HOUR=$(date +"%H%M%S")
	ARR=$(ls $FOLDER)
	for item in ${ARR[@]}
	do
        	grep $WORD $item > results_${DATE}_${HOUR}.txt
	done
	if [ "$?" -eq "0" ]
	then
		echo "The operation was successful"
		english_menu
	else
	
		echo "The operation could not be completed."
	fi

	english_menu
}

#################
#Opción 4: Salir
#El programa preguntará si el usuario desea salir (Y/N), 
#capturará (leerá) la respuesta del usuario, si
#decide salir, el programa termina. Si no decide salir, 
#el programa regresa al menú principal.
#################

function fourth_option_es()
{
	read -p "¿Está Seguro de querer salir?" ANSWER
	case $ANSWER in
	[nN])
	spanish_menu;;
	[sS])
	esac
}

function fourth_option_en()
{
	read -p "Are you sure you want to leave?" ANSWER
	case $ANSWER in
	[nN])
	english_menu;;
	[yY])
	esac
}

function english_menu()
{
	echo "######################"
	echo "Main Menu"
	echo "1. Copy / Move files"
	echo "2. File report"
	echo "3. Search for a word in files"
	echo "4. Exit"
	echo "######################"
	
	read -p "Enter your answer:" OPTION
	clear
	case $OPTION in
	1)first_option_en;;
	2)second_option_en;;
	3)third_option_en;;
	4)fourth_option_en;;
	*)echo "Wrong answer" 
	english_menu
	esac
}

function spanish_menu()
{
	echo "######################"
	echo "MENÚ PRINCIPAL"
	echo "1. Copiar/Mover archivos"
	echo "2. Reporte archivo"
	echo "3. Buscar una palabra en archivos"
	echo "4. Salir"
	echo "######################"
	
	read -p "Ingrese la opción:" OPTION
	clear
	case $OPTION in
	1)first_option_es;;
	2)second_option_es;;
	3)third_option_es;;
	4)fourth_option_es;;
	*)echo "Opción inválida"
	spanish_menu
	esac
}

################
#IMPORTANTE: Al ejecutar este aplicativo (con bash) se recibirá 
#un parámetro que indica el idioma del
#menú, opciones y mensajes así: (EN para inglés, ES para español, 
#cualquier otro valor para inglés).
################

if [ $1 = "ES" ];
then
	spanish_menu
else
	english_menu
fi





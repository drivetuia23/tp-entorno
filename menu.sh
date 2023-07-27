#!/bin/bash

salir=0

while [ $salir -ne 1 ]; do

  clear
  echo "Sistema"
  figlet "T P - E N T O R N O" 
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  figlet "Menu:" 
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  echo "1. Generar imágenes"
  echo "2. Descomprimir imágenes"
  echo "3. Procesar imágenes"
  echo "4. Comprimir imágenes" 
  echo "0. Salir"
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  read -p "Ingrese una opción: " opcion

  case $opcion in
    0)  
      salir=1
      figlet "Saliendo..." 
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
      sleep 1
      echo "Gracias por usar TP-Entorno."
      sleep 3
      clear
      ;;
      

    1)
	  clear
	  figlet "Generar imagenes" 
	  printf '%*s\n' "$(tput cols)" '' | tr ' ' -       

	  cantidad_imagenes=0
	  
	  while true; do
	    # Pregunta al usuario la cantidad de imágenes a generar
	    read -p "Ingrese la cantidad de imágenes a generar (0 para salir): " cantidad_imagenes
	    
	    if [[ $cantidad_imagenes -eq 0 ]]; then
	      # Salir
	      break
	      
	    elif [[ $cantidad_imagenes -ge 1 && $cantidad_imagenes -le 90000 ]]; then
	      # Ejecuta el script generar.sh con el valor ingresado como parámetro
	      ./generar.sh "$cantidad_imagenes"
	      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
	      read -p "Presione Enter para continuar hacia el menú..." nada
	      break
	      
	    else
	      # La entrada no es válida, mostrar mensaje y continuar el bucle
	      echo "Error: Ingrese un número entre 0 y 90000, o 0 para salir."
	    fi
	    
	  done
	  ;;

    2)
      clear
      figlet "Descomprimir imagenes" 
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -   
     ./descomprimir.sh imagenes.tar.gz verificacion.txt 
      read -p "Presione Enter para continuar hacia el menú..." 
      ;;

    3)
      clear
      figlet "Procesar imagenes" 
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -       
      ./procesar.sh
      read -p "Presione Enter para continuar hacia el menú..." 
      ;;

    4)
      clear
      figlet "Comprimir imagenes" 
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -       
      ./comprimir.sh
      read -p "Presione Enter para continuar hacia el menú..." 
      ;;

      

    *)
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
      echo "Opción no válida."
      sleep 2
      ;;

  esac

done


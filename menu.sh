#!/bin/bash

salir=0

while [ $salir -ne 1 ]; do

  clear
  echo "Sistema"
  figlet "T P - E N T O R N O" 
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  figlet "M E N U" 
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
       # Pregunta al usuario la cantidad de imágenes a generar
       read -p "Ingrese la cantidad de imágenes a generar: " cantidad_imagenes

       # Ejecuta el script generar.sh con el valor ingresado como parámetro
       ./generar.sh "$cantidad_imagenes"
       printf '%*s\n' "$(tput cols)" '' | tr ' ' -
       read -p "Presione Enter para continuar hacia el menú..." nada
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
      echo "Opción inválida"
      read -p "Presione Enter para continuar hacia el menú..."  
      ;;

  esac

done


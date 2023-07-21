#!/bin/bash

salir=0

while [ $salir -ne 1 ]; do

  clear
  echo "Sistema"
  ./titulo.sh "T P - E N T O R N O" slant 0
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  ./titulo.sh "M E N U" small 4
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  echo "0. Realizar verificaciones del entorno"
  echo "1. Generar imágenes"
  echo "2. Descomprimir imágenes"
  echo "3. Procesar imágenes"
  echo "4. Comprimir imágenes" 
  echo "5. Ayuda"
  echo "6. Salir"
  printf '%*s\n' "$(tput cols)" '' | tr ' ' -
  read -p "Ingrese una opción: " opcion

  case $opcion in
    0)  
      clear
      ./titulo.sh "Verificaciones del entorno" small 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
      ./verificaciones.sh 
      read -p "Presione Enter para continuar hacia el menú..." nada
      ;;


    1)
      clear
      ./titulo.sh "Generar imagenes" small 0
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
      ./titulo.sh "Descomprimir imagenes" small 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -   
      ./descomprimir.sh imagenes.tar.gz verificacion.txt 
      read -p "Presione Enter para continuar hacia el menú..." nada
      ;;

    3)
      clear
      ./titulo.sh "Procesar imagenes" small 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -       
      ./procesar.sh
      read -p "Presione Enter para continuar hacia el menú..." nada
      ;;

    4)
      clear
      ./titulo.sh "Comprimir imagenes" small 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -       
      ./comprimir.sh
      read -p "Presione Enter para continuar hacia el menú..." nada
      ;;

    5)
      clear
      ./titulo.sh "Ayuda" small 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -       
      echo "Muestra información de ayuda"
      read -p "Presione Enter para continuar hacia el menú..." nada
      ;;

    6)
      salir=1
      ./titulo.sh "Saliendo..." slant 0
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
      sleep 1
      echo "Gracias por usar TP-Entorno."
      sleep 3
      clear
      ;;

    *)
      printf '%*s\n' "$(tput cols)" '' | tr ' ' -
      echo "Opción inválida"
      read -p "Presione Enter para continuar hacia el menú..." nada 
      ;;

  esac

done


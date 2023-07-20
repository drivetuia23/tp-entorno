#!/bin/bash

salir=0

while [ $salir -ne 1 ]; do

  clear

  ./titulo.sh "Procesamiento de imagenes" slant 3

  ./titulo.sh "M E N U" small 0

  echo "1. Generar imágenes"
  echo "2. Descomprimir imágenes"
  echo "3. Procesar imágenes"
  echo "4. Comprimir imágenes" 
  echo "5. Ayuda"
  echo "6. Salir"

  read -p "Ingrese una opción: " opcion

  case $opcion in

    1)
      ./generar.sh
      ;;

    2)
      ./descomprimir.sh  
      ;;

    3)
      ./procesar.sh
      ;;

    4)
      ./comprimir.sh
      ;;

    5)
      echo "Muestra información de ayuda"
      ;;

    6)
      salir=1
      ./titulo.sh "Saliendo..." slant 0
      sleep 3
      clear

      ;;

    *)
      echo "Opción inválida" 
      ;;

  esac

done


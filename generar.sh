#!/usr/bin/env bash

# Verificar la cantidad de imágenes a generar (entre 1 y 300)
cantidad_imagenes=$1

if [ -z "$cantidad_imagenes" ]; then
  echo "Debes proporcionar la cantidad de imágenes a generar como argumento."
  exit 1
fi

# Crear directorio para las imágenes
directorio="img"
mkdir -p "$directorio"


# Nombres de personas desde servicio web .csv

csv_file=0
directorio_destino="$directorio"

# Descargar el archivo CSV con los nombres desde la Web
wget -O "$directorio_destino/$csv_file" "https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"

# Pasar los nombres del archivo CSV a un array
mapfile -t nombres < "$directorio_destino/$csv_file"


# Descargar imágenes desde el servicio web
for ((i=1; i<=cantidad_imagenes; i++))
do
  # Nombre aleatorio de archivo
  nombre_archivo="${nombres[$RANDOM % ${#nombres[@]}]}"
    
  # Descargar imagen desde https://thispersondoesnotexist.com/
  wget -q -O "$directorio/$nombre_archivo" "https://thispersondoesnotexist.com/"

  # Esperar 1 segundo entre descargas
  echo "Descargando imagen - $nombre_archivo " 
  sleep 1
done

# Comprimir las imágenes
tar -czf imagenes.tar.gz "$directorio"
 

# Generar la suma de verificación (MD5) del archivo comprimido

md5sum imagenes.tar.gz | awk '{print $1}' > verificacion.txt


# Mostrar información
echo "Imágenes generadas y comprimidas en imagenes.tar.gz"

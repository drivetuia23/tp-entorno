#!/usr/bin/env bash

# Verificar la cantidad de imágenes a generar
cantidad_imagenes=$1

if [ -z "$cantidad_imagenes" ]; then
  echo "Debe proporcionar la cantidad de imágenes a generar como argumento."
  exit 1
fi


# Crear directorio para las imágenes
directorio="img"
mkdir -p "$directorio"

echo "Espere un momento..."

# Nombres de personas desde servicio web .csv
csv_nombres="nombres.csv"
directorio_destino="$directorio"
url_origen="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"

# Descargar el archivo CSV con los nombres desde la url origen
wget -O "$directorio_destino/$csv_nombres" "$url_origen" > /dev/null 2>&1

# Pasar los nombres del archivo CSV a un array
mapfile -t nombres < "$directorio_destino/$csv_nombres"
echo "Nombres : OK."


# Descargar imágenes desde el servicio web
echo "Imágenes: OK."
echo "Generando..."

for ((i=1; i<=cantidad_imagenes; i++))
do
  # Nombre aleatorio de archivo
  # se toma como nombre solo hasta antes de la coma
  nombre_archivo=$(echo "${nombres[$RANDOM % ${#nombres[@]}]}" | cut -d ',' -f 1)
      
  # Descargar imagen desde https://thispersondoesnotexist.com/
  wget -q -O "$directorio/$nombre_archivo" "https://thispersondoesnotexist.com/" > /dev/null 2>&1

  # Esperar 1 segundo entre descargas
  echo "$i de $cantidad_imagenes - Descargando imagen de $nombre_archivo " 
  sleep 1

done

# Eliminar el archivo de nombres, si existe
[ -f "$directorio/$csv_nombres" ] && rm "$directorio/$csv_nombres"

# Comprimir las imágenes
echo "Comprimiendo..."

tar -czf imagenes.tar.gz "$directorio"

# Generar la suma de verificación (MD5) del archivo comprimido
md5sum imagenes.tar.gz | awk '{print $1}' > verificacion.txt

# Mostrar información
echo "Imágenes generadas y comprimidas en imagenes.tar.gz."
echo "Para descomprimirlas utilice la opción 2 del menú."

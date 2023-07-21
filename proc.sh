#!/bin/bash

# Directorio donde se encuentran las imágenes
directorio="img"

# Función para comprobar si un nombre de archivo contiene un nombre de persona válido
function es_nombre_valido() {
  nombre_archivo=$(basename "$1")
  patron="[A-Z][a-z]+"
  if [[ "$nombre_archivo" =~ $patron ]]; then
    return 0
  else
    return 1
  fi
}
# -----------------------------------------------------------------------------------------------------------
# Procesar las imágenes válidas en el directorio
echo "Procesando imágenes..."
for imagen in "$directorio"/*; do
  if es_nombre_valido "$imagen"; then
    echo "Procesando: $(basename "$imagen")"
    # Recortar la imagen a una resolución de 512x512 con ImageMagick
    convert "$imagen" -resize 512x512^ -gravity center -extent 512x512 "procesadas/$(basename "$imagen")"
  else
    echo "Saltando: $(basename "$imagen") (nombre de persona no válido)"
  fi
done

echo "Proceso completado. Las imágenes válidas han sido recortadas y se encuentran en el directorio 'procesadas'."

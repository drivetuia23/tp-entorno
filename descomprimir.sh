#!/bin/bash


# Verificar si se proporcionan los dos archivos como argumentos
if [ $# -ne 2 ]; then
  echo "Usage: $0 <compressed_images_file> <checksum_file>"
  exit 1
fi

compressed_images_file="$1"
checksum_file="$2"

# Verificar si los archivos existen
if [ ! -f "$compressed_images_file" ]; then
  echo "El archivo de imágenes comprimidas '$compressed_images_file' no existe."
  exit 1
fi

if [ ! -f "$checksum_file" ]; then
  echo "El archivo de suma de verificación '$checksum_file' no existe."
  exit 1
fi

# Verificar la suma de verificación de las imágenes
checksum_output=$(md5sum -c "$checksum_file" 2>&1)

# Verificar si hubo algún error en la verificación
if echo "$checksum_output" | grep -q "FAILED"; then
  echo "Error: La verificación de la suma de verificación ha fallado."
  exit 1
fi

# Si no hay errores, proceder con la descompresión
echo "Verificación exitosa. Comenzando la descompresión..."

# Lógica de descompresión aquí
# Por ejemplo, para descomprimir un archivo tar.gz:
# tar -xzf "$compressed_images_file"

echo "Descompresión completada con éxito."


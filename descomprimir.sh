#!/bin/bash


# Verificar si se proporcionan los dos archivos como argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 <archivo_comprimido> <suma_check>"
  exit 1
fi

archivo_comprimido="$1"
suma_check="$2"

# Verificar si los archivos existen
if [ ! -f "$archivo_comprimido" ]; then
  echo "El archivo de imágenes comprimidas '$archivo_comprimido' no existe. No puede ejecutar este programa."
  sleep 3
  exit 1
fi

if [ ! -f "$suma_check" ]; then
  echo "El archivo de suma de verificación '$suma_check' no existe. No puede ejecutar este programa."
  sleep 3
  exit 1
fi


# Verificar la suma de verificación de las imágenes
suma_check_salida=$(md5sum -c "$suma_check" 2>&1)

# Verificar si hubo algún error en la verificación
if echo "$suma_check_salida" | grep -q "FAILED"; then
  echo "Error: La verificación de la suma de verificación ha fallado."
  sleep 3
  exit 1 
fi

# Si no hay errores, proceder con la descompresión
echo "Verificación exitosa. Comenzando la descompresión..."
# Descomprime reescribiendo sobre el directorio img 
tar -xvf "$archivo_comprimido" -C /img


echo "Descompresión completada con éxito."
sleep 3











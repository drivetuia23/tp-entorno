#!/usr/bin/env bash



# Verificar la cantidad de imágenes a generar (entre 1 y 300)
cantidad_imagenes=$1

if [ -z "$cantidad_imagenes" ]; then
  echo "Debes proporcionar la cantidad de imágenes a generar como argumento."
  exit 1
fi

if (( cantidad_imagenes < 1 || cantidad_imagenes > 300 )); then
  echo "La cantidad de imágenes a generar debe estar entre 1 y 300."
  exit 1
fi

# Crear directorio para las imágenes
directorio="img"
# mkdir -p "$directorio"

# Nombres de archivo aleatorios
nombres=("John" "Jane" "Mari" "Claudio" "javi" "soraya" "Natalia" "Alice" "Bob" "Eve" "Ana" "paula" "juan")  # acá entra la list con los 300 nombres

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








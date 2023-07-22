#!/bin/bash

directorio="img"
directorio_procesadas="procesadas"
directorio_salida="generados"

if [ -d "$directorio" ] && [ -d "$directorio_procesadas" ]; then
	
 	# Crear directorio de salida si no existe
	mkdir -p "$directorio_salida"

	# Generar archivo con la lista de nombres de todas las imágenes
	echo "Archivo con la lista de nombres de todas las imágenes: OK"
	find "$directorio_procesadas" -type f -exec basename {} \; > "$directorio_salida/lista_nombres_imagenes.txt"

	# Generar archivo con la lista de nombres válidos
	echo "Archivo con la lista de nombres válidos: OK"
	grep -E '[A-Z][a-z]+' "$directorio_salida/lista_nombres_imagenes.txt" > "$directorio_salida/lista_nombres_validos.txt"

	# Generar archivo con el total de personas cuyo nombre finaliza con la letra 'a'
	echo "Archivo con el total de nombres finalizados con 'a': OK"
	grep -E '[A-Za-z]+a[^,]*$' "$directorio_salida/lista_nombres_validos.txt" | wc -l > "$directorio_salida/total_nombres_con_a.txt"
	# grep modificado para que lea hasta la coma dentro del nombre de archivo (segun formato nombre,numero)
  
	# Crear archivo comprimido con todos los archivos generados y las imágenes
	echo "Archivo comprimido: OK"
	tar -czf archivos_generados.tar.gz "$directorio_salida" "$directorio_procesadas"

	echo "Proceso completado. Se generaron los archivos con info de las imágenes y comprimido 'archivos_generados.tar.gz' que incluye todo el contenido."
	sleep 4
else 
	echo "No puede ejecutar este programa porque no existe el directorio de imágenes y/o el directorio de procesadas."
	sleep 2
fi

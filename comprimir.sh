#!/bin/bash

directorio="img"
directorio_procesadas="procesadas"
if [ -d "$directorio" ] && [ -d "$directorio_procesadas" ]; then
	# Directorio donde se encuentran las imágenes procesadas
	directorio_procesadas="procesadas"

	# Directorio donde se almacenarán los archivos generados
	directorio_salida="generados"

	# Crear directorio de salida si no existe
	mkdir -p "$directorio_salida"

	# Generar archivo con la lista de nombres de todas las imágenes
	echo "Generando archivo con la lista de nombres de todas las imágenes..."
	find "$directorio_procesadas" -type f -exec basename {} \; > "$directorio_salida/lista_nombres_imagenes.txt"

	# Generar archivo con la lista de nombres válidos
	echo "Generando archivo con la lista de nombres válidos..."
	grep -E '[A-Z][a-z]+' "$directorio_salida/lista_nombres_imagenes.txt" > "$directorio_salida/lista_nombres_validos.txt"

	# Generar archivo con el total de personas cuyo nombre finaliza con la letra 'a'
	echo "Generando archivo con el total de personas cuyo nombre finaliza con la letra 'a'..."
	grep -E '[A-Z][a-z]+a&' "$directorio_salida/lista_nombres_validos.txt" | wc -l > "$directorio_salida/total_nombres_con_a.txt"

	# Crear archivo comprimido con todos los archivos generados y las imágenes
	echo "Creando archivo comprimido..."
	tar -czf archivos_generados.tar.gz "$directorio_salida" "$directorio_procesadas"

	echo "Proceso completado. Se han generado los archivos solicitados y el archivo comprimido 'archivos_generados.tar.gz' que incluye todo el contenido."
	sleep 4
else 
	echo "No puede ejecutar este programa."
	sleep 2
fi

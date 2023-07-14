#!/bin/bash/env
# Autor: Mariana Bettoni
# Versión 1
# La intención del script es descargar una imagen desde la web, se debe poder indicar POR argumento cuantas imagenes
# generary se deben asignar nombres de archivos al azar de una lista de nombres de personas. 
# Luego se generará un archivo comprimido con las imagenes y entregará la suma de verificación.
 



# Función para genearar imagenes
generar_imagenes() {
	echo "Igresse la cantidad de imagenes: "
	read cantidad
	[[ | $cantidad =- ^[0-9]+$ ]] && 
	echo  "$Generando $Cantidad Imagenes..."
	/app/scripts/generar.sh $cantidad
}


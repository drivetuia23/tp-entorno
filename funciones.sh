#!/bin/env/bash
# Autor: Mariana Bettoni
# Versión 1.1
# La intención del script es descargar una imagen desde la web, se debe poder indicar POR argumento cuantas imagenes
# generary se deben asignar nombres de archivos al azar de una lista de nombres de personas. 
# Luego se generará un archivo comprimido con las imagenes y entregará la suma de verificación.
 



# Función para genearar imagenes
generar_imagenes() {
	echo "Igresse la cantidad de imagenes: "
	read cantidad
	[[ | $cantidad =- ^[0-9]+$ ]] && #falta determinar de donde vienen las imagenes 
	echo  "$Generando $Cantidad Imagenes..."
	/home/mariana/Escritorio/TP Entornos de programación/generar.sh $cantidad
}

descomprimir_archivo() {
        echo "Descomprimiendo archivos..."
        archivo_imagenes=/app/datasets/imagenes.tar.gz
        archivo_checksun=/app/datasets/checksun
        /home/mariana/Escritorio/TP Entornos de programación/descomprimir.sh $archivo_imagenes $arch
}

procesar_imagenes() {
	echo "Procesando imagenes"
	/home/mariana/Escritorio/TP Entornos de programación/procesar.sh
}


comprimir_archivos() {
	echo "Comprimiendo archivos y generando lista de imagenes"
	/app/scripts/comprimir.sh
}

while true: do
	echo
	echo
	echo
	echo



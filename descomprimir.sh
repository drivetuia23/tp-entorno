#!/bin/bash


# Esta función  va a descomprimir las imgagenes generadas por la función anterior

descomprimir_archivo() [
	echo "Descomprimiendo archivos..."
	archivo_imagenes=/app/datasets/imagenes.tar.gz
	archivo_checksun=/app/datasets/checksun
	/app/scripts/descomprimir.sh $archivo_imagenes $arch
}

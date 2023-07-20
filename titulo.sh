#!/bin/bash

mostrar_ayuda() {
    echo "Uso: $0 <titulo> [fuente] [color]"
    echo
    echo "Genera un título en arte ASCII utilizando la fuente y el color especificados."
    echo
    echo "Si no se proporciona la fuente, se utilizará 'standard' por defecto."
    echo "Si no se proporciona el color, se utilizará un color aleatorio."
    echo
    echo "Opciones de color:"
    echo "  1: Rojo"
    echo "  2: Azul"
    echo "  3: Verde"
    echo "  4: Amarillo"
    echo "  0: Color aleatorio"
    echo
    echo "Ejemplo de uso:"
    echo "$0 'Título del Arte ASCII' slant 3"
    echo
    echo "Fuentes disponibles:"
    echo
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    mostrar_ayuda
    exit 0
fi

if [ $# -lt 1 ] || [ $# -gt 3 ]; then
    echo "Error: Se requiere al menos un parámetro y como máximo tres."
    mostrar_ayuda
    exit 1
fi

titulo="$1"
fuente="standard"
color=""

if [ $# -ge 2 ]; then
    fuente="$2"
fi

if [ $# -eq 3 ]; then
    color="$3"
fi

if [ "$color" == "0" ]; then
    color=$(shuf -i 1-4 -n 1)
fi

case "$color" in
    "1") color="31";;
    "2") color="34";;
    "3") color="32";;
    "4") color="33";;
    *) color="";;
esac

if [ -n "$color" ]; then
    echo -e "\e[${color}m"
fi

# figlet -f "$fuente" -c "$titulo"
# echo -e "\e[0m"

ancho_pantalla=$(tput cols)
titulo_centralizado=$(figlet -f "$fuente" -w "$ancho_pantalla" -c "$titulo")
echo "$titulo_centralizado"

#!/bin/bash

# Función para instalar paquetes si no están instalados
install_package_if_not_installed() {
    if ! dpkg -s "$1" &> /dev/null; then
        echo "Instalando $1..."
        sudo apt-get update
        sudo apt-get install -y "$1"
    else
        echo "$1 ya está instalado."
    fi
}

# Verificar e instalar paquetes necesarios
install_package_if_not_installed "figlet"
install_package_if_not_installed "imagemagick"
install_package_if_not_installed "tar"
install_package_if_not_installed "coreutils" # Incluye el comando 'md5sum'

# Verificar y crear directorios
mkdir -p "img"
mkdir -p "archivos_generados"
mkdir -p "procesadas"

# Verificar espacio en disco
available_space=$(df -BM . | awk 'NR==2 {print $4}' | tr -d 'M')
if (( available_space < 100 )); then
    echo "Advertencia: Solo hay $available_space MB de espacio disponible en el disco."
else
    echo "Espacio suficiente en disco."
fi

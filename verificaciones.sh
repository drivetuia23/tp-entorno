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

# Función para verificar y crear directorios
create_directory_if_not_exists() {
    if [ ! -d "$1" ]; then
        echo "Creando directorio $1..."
        mkdir -p "$1"
    else
        echo "El directorio $1 ya existe."
    fi
}

# Función para verificar espacio en disco
check_disk_space() {
    available_space=$(df -BM . | awk 'NR==2 {print $4}' | tr -d 'M')
    if (( available_space < 100 )); then
        echo "Advertencia: Solo hay $available_space MB de espacio disponible en el disco."
    else
        echo "Espacio suficiente en disco."
    fi
}

# Preguntar al usuario si desea realizar las verificaciones
read -p "¿Desea realizar las verificaciones? (S/n): " response
if [[ $response == "S" || $response == "s" ]]; then
    # Verificar e instalar paquetes necesarios
    install_package_if_not_installed "figlet"
    install_package_if_not_installed "imagemagick"
    install_package_if_not_installed "tar"
    install_package_if_not_installed "coreutils" # Incluye el comando 'md5sum'

    # Verificar y crear directorios
    create_directory_if_not_exists "img"
    create_directory_if_not_exists "archivos_generados"
    create_directory_if_not_exists "procesadas"

    # Verificar espacio en disco
    check_disk_space
else
    # Mostrar mensajes informativos si no se realizan las verificaciones
    echo "Verificaciones no realizadas."
    install_package_if_not_installed "figlet"
    install_package_if_not_installed "imagemagick"
    install_package_if_not_installed "tar"
    install_package_if_not_installed "coreutils" # Incluye el comando 'md5sum'
    create_directory_if_not_exists "img"
    create_directory_if_not_exists "archivos_generados"
    create_directory_if_not_exists "procesadas"
    check_disk_space
fi


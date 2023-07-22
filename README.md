<p align="center"><img src="https://github.com/drivetuia23/tp-entorno/blob/main/FCEIA-logo.png" width="400"></a></p>

# Nombre del Proyecto: 
  ## _Trabajo Práctico Entorno Programación Grupo 4 - TUIA 2023_

  ## Nombre del Sistema: 
  ### tp-entorno
  ## Autores:
El TP-Entorno TUIA23 está organizado, en relación a los users, de la siguiente forma:
### Cuenta principal del TP: drivetuia23@gmail.com
### Cuentas de desarrolladores: 
| Nombre  | Mail |
|---------|-------------|
| Mariana Bettoni | bettoni.bat@gmail.com |
| Javier Centurión | feceiaestudiante@gmail.com |
| Claudio Saldias | claudio.saldias@gmail.com |

# Entorno: 
  ## ubuntu 
*  PRETTY_NAME="Ubuntu 22.04.2 LTS"
*  VERSION="22.04.2 LTS (Jammy Jellyfish)"

# Documentación
## Descripción:
## Estado
Desarrollo - Testing
## Instalación: (instrucciones)
1. Clonar este repositorio en tu sistema local.
2. Asegurarse de tener instalado Bash en tu sistema.
3. Ejecutar el script `menu.sh` en la terminal.
4. Enlace de descarga: https://github.com/drivetuia23/tp-entorno.git
5. Token de acceso: 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
   
## Requisitos: (dependencias o bibliotecas)
Para el correcto funcionamiento, el sistema requiere de los siguientes paquetes:

1. **figlet**: impresión de titulos en ASCCI Art
2. **imagemagick**: tratamiento de imágenes
3. **tar**: compresión/descompresión de imagenes
4. **coreutils**: incluye el comando md5sum
5. **pandoc**_ mostrar el archivo README.md en fotmato html

## Licencia: Restrigida a colaboradores/revisores
## Estructura del sistema TP-ENTORNO
El sistema está compuesto por los siguientes scripts:

### menu.sh
Este script Bash muestra diversas opciones para realizar acciones relacionadas con un entorno de procesamiento de imágenes. Al ejecutarse, muestra un menú con diferentes opciones numeradas, desde realizar verificaciones del entorno hasta salir del programa. El usuario puede ingresar un número para seleccionar una opción y ejecutar la acción correspondiente. Las opciones del menú incluyen tareas como generar imágenes, descomprimir imágenes, procesar imágenes, comprimir imágenes, mostrar ayuda y salir del programa. Cada opción seleccionada muestra un título personalizado y ejecuta un script específico para llevar a cabo la tarea asociada. Cada vez que una acción se completa, el programa espera a que el usuario presione Enter para volver al menú principal y seleccionar otra opción.

### verificaciones.sh
Programa que es llamado desde el menú (oción número 0) que realiza verificaciones básicas en un sistema y toma medidas para asegurar que los recursos necesarios estén presentes para ciertas tareas. El programa verifica si algunos paquetes están instalados y los instala si no lo están. También comprueba la existencia de ciertos directorios y los crea si no están presentes. Finalmente, verifica el espacio disponible en disco y advierte al usuario si hay poca capacidad de almacenamiento. El programa da la opción al usuario de realizar o no las verificaciones antes de llevar a cabo las acciones necesarias para garantizar que todo esté configurado correctamente.

<p align="center"><img src="https://github.com/drivetuia23/tp-entorno/blob/main/FCEIA-logo.png" width="400"></a></p>

# _Trabajo Práctico Entorno Programación Grupo 4 - TUIA 2023_

## Introducción
La presente entrega surge del documento [Trabajo Practico Final 2023](https://drive.google.com/file/d/1KKVDdJaA6RKaLsaN2kOjZEvV_cZJ8ZsW/view?usp=sharing) de la Carrera TUIA, asignatura Entorno de Programación. 

*  El enunciado pide desarrollar un sistema en **bash**, con un manejo general que debe incluir repositorios **Git** imágenes **Docker**.

*  El sistema debe permitir un tratamiento básico de __imágenes de personas__ a las que se les asocia un __nombre__; Ambos tipos de datos se obtienen desde internet. 

*  El usuario se manejará en un menú que ejecuta las utilidades del sistema para el tratamiento de imagenes, como la obtención, la compresión, la conversión en uno de sus atributos y el empaquetamiento con información asociada al procesamiento de las mismas.

### Autores

**Cuenta principal del TP:** drivetuia23@gmail.com

**Desarrolladores**
| Nombre  | Mail |
|---------|-------------|
| Mariana Bettoni | bettoni.bat@gmail.com |
| Javier Centurión | feceiaestudiante@gmail.com |
| Claudio Saldias | claudio.saldias@gmail.com |

# Sistema

## _tp-entorno_

**Estado**: Desarrollo - Testing


**Licencia**: Restringida a colaboradores/revisores

### Entorno de ejecución
* ubuntu 
* PRETTY_NAME="Ubuntu 22.04.2 LTS"
* VERSION="22.04.2 LTS (Jammy Jellyfish)"
  
# Instalación
Enlace de descarga: https://github.com/drivetuia23/tp-entorno.git
1.  Verifique que su sistema y Docker estén actualizados y disponibles.
2.  _Puede serguir estos pasos para actualizar e instalar Docker en su máquina_ [Procedimientos Instalación y ejecución TP-ENTORNO Grupo 4](https://drive.google.com/file/d/1CxTLDZW3avIHoTGcAivecbQKgR71FugF/view?usp=sharing) El documento contiene también el procedimiento para clonar directamente y ejecutar, e info sobre el uso del sitema a través de sus pantallas.
3.  Descargue desde este repositorio el archivo __Dockerfile__ y ejecútelo en su consola

**Requisitos**

Para el correcto funcionamiento, el sistema requiere de los siguientes paquetes:
1. **imagemagick**: tratamiento de imágenes
2. **wget**: descarga de archivos desde internet
3. **tar**: empaquetar y comprimir archivos y directorios
4. **git**: sistema de control de versiones
5. **figlet**: impresión de titulos en ASCII art

## Estructura del sistema
El sistema está compuesto por:

![image](https://github.com/drivetuia23/tp-entorno/assets/136250619/fc1c7d8c-6bc1-4553-a618-ed8d24c21220)

Dockerfile, README.md y FCEIA-logo.png corresponden a la ejecución de la imagen y la documentacion en el repo. Lo demás, son los scripts que se describen a continuación.

### 0.  menu.sh
Este componente es el articulador de las funciones que permite el sistema para obtener y nombrar archivos de imágenes provenientes de una url Web, y disponerlas en un paquete comprimido para su posterior uso. A su vez, el menú permite ejecutar opciones para reducir el tamaño de las imágenes y, finalmente, empaquetar dicho output junto con estadística básica sobre los archivos procesados.

El script presenta un titular, las opciones disponibles y su elección, validaciones de ingreso y una estructura de ejecución de casos con validaciones y titulares propios.

### 1.  generar.sh
Antes de entrar a este script, el menú toma el control del ingreso de la cantidad de imágenes a generar. La condición actual es número entero en el rango 1 a 90.000 (el máximo es por la cantidad de nombres aproximados disponibles). Si no se desea generar imagenes, se ingresa un cero. 

Al ser llamado desde el menú, recibe un número desde y realiza estas rutinas si es que dicho valor es válido:
- Obtiene los nombres desde un servicio web y los almacena en forma local
- Descarga las imagenes de personas desde un servicio web de acuerdo a la cantidad de imágenes a generar indicada por el usuario, y les asigna un nobre al azar. En el ciclo va informando el estado del proceso.
- Comprime el directorio con las imagenes generadas y chequea validez de la compresión.
- Muestra info final y vuelve al menú
  
El work directory agrega un direcotrio nuevo llamado **img** con los archivos de imagen generados, y un paquete **imagenes.tar.gz** con dicha carpeta y el archivo __verificacion.txt__

### 2.  descomprimir.sh
### 3.  procesar.sh
### 4.  comprimir.sh


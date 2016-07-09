#!/bin/bash
################################################################################
# Sitio web: proyectosbeta.net
# Autor: Jose Alberto Gonzalez von Schmeling
# Fecha: 29 de junio de 2016 a las 22:15
# Version: 0.1
#
# Programas necesarios:
# - osm2pgsql
#
# Este script actualiza tu base de datos PostgreSQL/PostGIS con los datos OSM
# de Paraguay. Se asume que ya se tiene una base de datos de Paraguay con 
# datos osm. La base de datos se deberia de llamar paraguay2.
# Tambien se debe crear una carpeta en el escritorio llamada OSM.
################################################################################
pathOSM=~/Escritorio/OSM/

# Se dirige a la ruta pathOSM.
cd $pathOSM

# Obtener el ultimo numero para el osc.z
wget -q http://download.geofabrik.de/south-america/paraguay-updates/state.txt -O - | tr '\n' ' ' | grep -o 'sequenceNumber=.*' > numero.txt
numero=$(<numero.txt)
prefix="sequenceNumber="
suffix=" "
ultimaVersionOSC=${numero#$prefix}
ultimaVersionOSC=${ultimaVersionOSC%$suffix}
extensionArchivoOSC=".osc.gz"

# Verificar si ya existe la carpeta Datos.
if [ ! -d Datos ]; then
    # Crear carpeta Datos
    mkdir Datos
fi
Datos="Datos/"

# Carpeta Logs.
# Verificar si ya existe la carpeta Logs.
if [ ! -d Logs ]; then
    # Crear carpeta Logs
    mkdir Logs
fi
Logs="Logs/"

# Descargar
cd $pathOSM$Datos 
wget -c http://download.geofabrik.de/south-america/paraguay-updates/000/000/$ultimaVersionOSC$extensionArchivoOSC

# Actualizar la base de datos paraguay2 con el usuario postgres.
cd $pathOSM$Logs
timestamp=$(date +%Y-%m-%d_%H:%M:%S)
time osm2pgsql --append -d paraguay2 -U postgres -P 5433 -H localhost --slim $pathOSM$Datos$ultimaVersionOSC$extensionArchivoOSC > $ultimaVersionOSC".osc__"$timestamp.log 2>&1

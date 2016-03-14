#!/bin/bash
##############################################################################
# Sitio web: proyectosbeta.net
# Autor: Jose Alberto Gonzalez von Schmeling
# Fecha: 13 de marzo de 2016 a las 20:55
# Version: 0.1
#
# Programas necesarios:
# - ogr2ogr
#
# Este script convierte todos los shp de los barios de Asuncion al formato 
# GeoJSON.
##############################################################################
# Variables.
pathSHP=~/Escritorio/BarriosAsu/

# Se dirige a la ruta pathSHP.
cd $pathSHP

# Verificar si ya existe la carpeta GeoJSON.
if [ ! -d GeoJSON ]; then
    # Crear carpeta GeoJSON
    mkdir GeoJSON
fi
GeoJSON="GeoJSON/"

# Crea los archivos GeoJSON.
IFS=''
# Reemplazar todos los espacios en blanco por _
for file in pathSHP *
do
    file=${file%*/}
    if [[ ( $file != 'pathSHP' ) && ( -d "$DIRECTORY" ) ]];
    then
        mv "${file}" "${file// /_}";
    fi
done

# Recorre solo los shp.
for file in pathSHP *.shp
do
    file=${file%*/}
    if [ $file != 'pathSHP' ];
    then
        nombre="${file%.*}"
        echo $nombre
    
        ogr2ogr -f GeoJSON -t_srs crs:84 $GeoJSON$nombre.geojson $nombre.shp
    fi
done

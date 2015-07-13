#!/bin/bash
##############################################################################
# Sitio web: proyectosbeta.net
# Autor: Jose Alberto González von Schmeling
# Fecha: 10 de julio de 2015 a las 15:17
# Version: 0.1
#
# Programas necesarios:
# - wget
# - unzip
# - osmosis 0.43.1
#
# Este script descarga del sitio GeoFabrik los datos OSM de Paraguay, luego
# crea 17 archviso OSM de los departamentos de Paraguay.
# Dentro de la carpeta OSM se encuentran los archivos OSM
# La ruta seria /home/tuUsuario/Paraguay/OSM
##############################################################################
# Variables.
archivoParaguayOSM=paraguay-latest.osm.pbf
pathPoly=Poly/
pathOSM=OSM/

# Crear la carpeta de Paraguay en el home de tu usario, solo si no existe.
cd ~
if [ ! -d Paraguay ]; then
    mkdir Paraguay
fi
cd Paraguay

# Elimina el archivo paraguay-latest.osm.pbf
if [ -f $archivoParaguayOSM ]; then
    # Descargar de GeoFabrik los datos de OSM de Paraguay.
    rm -f ~/Paraguay/$archivoParaguayOSM
fi
wget -c http://download.geofabrik.de/south-america/paraguay-latest.osm.pbf

# Elimina el archivo Poly_Departamentos_Paraguay.zip
if [ -f Poly_Departamentos_Paraguay.zip ]; then
    # Descargar los archivos poly de los 17 departamentos de Paraguay.
    rm -f ~/Paraguay/Poly_Departamentos_Paraguay.zip
fi
wget -c http://proyectosbeta.net/Arhivos%20del%20Blog/GIS/poly/Poly_Departamentos_Paraguay.zip
unzip -u Poly_Departamentos_Paraguay.zip

# Verificar si ya existe la carpeta OSM.
if [ ! -d OSM ]; then
    # Crear carpeta OSM
    mkdir OSM
fi

# Crea los archivos OSM de los 17 departamentos de Paraguay.
for file in Poly/*
do
    archivoPoly="${file##*/}"
    nombreArchivoPoly="${archivoPoly%.*}"
    rutaArchivoPoly=$pathPoly$archivoPoly
    archivoRutaOSM=$pathOSM/$nombreArchivoPoly.osm
    osmosis --read-pbf file=$archivoParaguayOSM --bounding-polygon file=$rutaArchivoPoly --write-xml $archivoRutaOSM
done

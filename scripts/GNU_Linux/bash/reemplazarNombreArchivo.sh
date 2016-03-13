#!/bin/bash
##############################################################################
# Sitio web: proyectosbeta.net
# Autor: Jose Alberto Gonzalez von Schmeling
# Fecha: 12 de marzo de 2016 a las 12:40
# Version: 0.1
#
# Este script reemplaza todos los nombre de archivos que comienzan con BarriosAsu_nombre__
# por un ningun caracter.
##############################################################################
# Variables.
pathSHP=~/Escritorio/BarriosAsu/

# Se dirige a la ruta pathSHP.
cd $pathSHP

# Recorre todo el directorio.
for file in pathSHP *
do
    file=${file%*/}
    if [[ ( $file != 'pathSHP' ) ]];
    then
        echo $file
	file2="$(echo "${file}" | sed 's/BarrioAsuncion_nombre__//')"
        mv "${file}" "${file2}"
    fi
done

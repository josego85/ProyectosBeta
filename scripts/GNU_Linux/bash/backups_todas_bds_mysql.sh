#!/bin/bash
#################################################################################
# Script para hacer dumps de todas las bases de datos de MySQL. 
# Ademas por cada base de datos comprime y genera un MD5 y SHA256.
#
# Obs:
# - Se utiliza Debian Jessie de 64 bits.
# - Se utiliza MySQL 5.7
# - Se requiere tener 7zip. (sudo apt-get install p7zip-full)
#
# Nombre del archivo: backups_todas_bds_mysql.sh
# Autor: josego
# Fecha de creacion:      12 de abril de 2017 a las 12:30 hs.
# Fecha de actualizacion: ---------
#################################################################################
# Fecha actual del sistema.
fechaActual=$(date '+%Y_%m_%d__%H_%M_%S')

# Backups de todas las base de datos.
# Las base de datos que se excluyen son:
# - mysql 
# - sys
# - information_schema
# - performance_schema

# Se tiene que crear las siguientes carpetas.
# - mkdir /var/proyectosbeta/
# - mkdir /var/proyectosbeta/bks/
# - mkdir /var/proyectosbeta/bks/mysql/

# Variables usadas para el backup de todas las base de datos MySQL.
pathBackupSQL=/var/proyectosbeta/bks/mysql/

# Se tiene que crear el archivo localhost_bk.conf con lo siguiente:
# [client]
# user = root
# password = "123456"
# host = localhost 
pathUserPassMySQL=/etc/mysql/mysql.conf.d/localhost_bk.conf

# Se obtiene todas las base de datos de MySQL.
databases=`mysql --defaults-extra-file=$pathUserPassMySQL -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ ( "$db" != "mysql" ) && ( "$db" != "sys" ) && ( "$db" != "information_schema" ) && ( "$db" != "performance_schema" ) ]] ; then
        nombreArchivo=$db"__"$fechaActual
        archivoLOG=$nombreArchivo".log"
        archivoSQL=$nombreArchivo".sql"
        archivo7Z=$nombreArchivo".7z"
        archivoMD5=$nombreArchivo".MD5SUMS"
        archivoSHA256=$nombreArchivo".SHA256SUMS"

        # Ir al path backup.
        cd $pathBackupSQL

        # Se registra en el archivo LOG.
        echo "Inicio:" $fechaActual > $archivoLOG

        # Dump de la base de datos.
        echo "Dumping database: $db" >> $archivoLOG
        mysqldump --defaults-extra-file=$pathUserPassMySQL --databases $db > $archivoSQL

        # Compresion del archivo SQL que se genero.
        echo "Se comprime el archivo" $archivoSQL >> $archivoLOG
        7z a -t7z -m0=lzma -mx=9 -mfb=258 -md=32m -ms=on -mmt=on $archivo7Z $archivoSQL >> $archivoLOG

        # Se crea el archivo MD5 del archivo generado.
        echo "Se crea el MD5 del archivo" $archivoMD5 >> $archivoLOG
        md5sum $archivo7Z > $archivoMD5

        # Se crea el archivo SHA256 del archivo generado.
        echo "Se crea el SHA256 del archivo" $archivoSHA256 >> $archivoLOG
        sha256sum $archivo7Z > $archivoSHA256 

        # Se borra el archivo SQL generado.
        echo "Se borra el archivo" $archivoSQL >> $archivoLOG
        rm $archivoSQL 

        # Fin del archivo LOG.
        echo "Fin:" $(date '+%Y_%m_%d__%H_%M_%S') >> $archivoLOG
    fi
done
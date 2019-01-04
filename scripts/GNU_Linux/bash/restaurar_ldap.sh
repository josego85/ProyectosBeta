#!/bin/sh
################################################################################################
# Script que sirve para restaurar la BD del LDAP a traves de un respaldo .ldif
# Nombre del archivo: restaurar_ldap.sh
# Autor: josego85@gmail.com
# Blog: https://proyectosbeta.net
# Fecha creacion: 04 de enero de 2019 a las 09:46 hs.
# Fecha de actualizacion: 04 de enero de 2019 a las 10:52 hs.
# Nota: Este servicio debe ser ejecutado como root
#
# Informacion de tareas:
# - Detener el servicio ldap
# - Borrar BD actual (borra todas las bases de datos)
# - Cargar el respaldo desde el ldif
# - Reindexar la BD
# - Cambiar permisos
# - Reiniciar el servicio
################################################################################################
FECHA_HORA_ACTUAL=$(date '+%Y_%m_%d_%H_%M_%S')
NOMBRE_ARCHIVO="restaurar_ldap_"$FECHA_HORA_ACTUAL
ARCHIVO_LOG=$NOMBRE_ARCHIVO".log"
RUTA_ARCHIVO_LDAP="/home/proyectosbeta/"
NOMBRE_ARCHIVO_LDAP="bkp_ldif"

echo "Fecha inicio: " $FECHA_HORA_ACTUAL > $ARCHIVO_LOG
echo " -- Deteniendo el servicio LDAP" >> $ARCHIVO_LOG
/etc/init.d/slapd stop

echo " -- Borrando base de datos LDAP" >> $ARCHIVO_LOG
rm -Rf /var/lib/ldap/*

echo " -- Restaurando desde el respaldo ldif" >> $ARCHIVO_LOG
slapadd -v -c -l $RUTA_ARCHIVO_LDAP$NOMBRE_ARCHIVO_LDAP

echo " -- Reindexando base de datos LDAP" >> $ARCHIVO_LOG
slapindex -v

echo " -- Cambiando permisos de usuario y grupo LDAP" >> $ARCHIVO_LOG
chown -Rf openldap.openldap /var/lib/ldap/*

echo " -- Reiniciando servicio LDAP" >> $ARCHIVO_LOG
/etc/init.d/slapd start

echo "Fecha fin: " $(date '+%Y_%m_%d__%H_%M_%S') >> $ARCHIVO_LOG

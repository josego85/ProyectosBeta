#!/bin/bash
##############################################################################
# Sitio web: proyectosbeta.net
# Autor: Jose Alberto Gonzalez von Schmeling
# Fecha: 16 de abril de 2016 a las 18:19
# Version: 0.1
#
# Este script limpia la cache de los paquets que se descargaron al utilizar 
#apt-get o aptitude en Debian Jessie.
##############################################################################
apt-get autoremove
apt-get clean
apt-get autoclean
aptitude clean
aptitude autoclean

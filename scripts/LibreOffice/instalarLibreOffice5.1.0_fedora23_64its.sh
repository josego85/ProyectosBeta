#!/bin/bash
# Autor: josego
# Blog: proyectosbeta.net
# Fecha: 20 de febrero de 2016
# Desinstala por completo si se tiene instalado LibreOffice.
# Se instala LibreOffice 5.1.0 en español en Fedora 23con su manual de ayuda correspondiente.
dnf erase libreoffice* -y

# Creamos una carpeta nueva llamada libreoffice en /tmp 
cd /tmp/
mkdir libreoffice

# Entramos a la carpeta que recién creamos.
cd libreoffice

# Descargamos los tres paquetes rpm para tener instalado libreOffice en español con su respectiva ayuda.
wget -c http://download.documentfoundation.org/libreoffice/stable/5.1.0/rpm/x86_64/LibreOffice_5.1.0_Linux_x86-64_rpm.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/5.1.0/rpm/x86_64/LibreOffice_5.1.0_Linux_x86-64_rpm_langpack_es.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/5.1.0/rpm/x86_64/LibreOffice_5.1.0_Linux_x86-64_rpm_helppack_es.tar.gz

# Descomprimimos.
tar xzvf /tmp/libreoffice/LibreOffice_5.1.0_Linux_x86-64_rpm.tar.gz
cd LibreOffice_5.1.0.3_Linux_x86-64_rpm

# Instalamos todos los paquetes rpm.
dnf install RPMS/*.rpm -y

# Descomprimimos.
tar xzvf /tmp/libreoffice/LibreOffice_5.1.0_Linux_x86-64_rpm_langpack_es.tar.gz
cd LibreOffice_5.1.0.3_Linux_x86-64_rpm_langpack_es

# Instalamos todos los paquetes rpm.
dnf install RPMS/*.rpm -y

# Descomprimimos.
tar xzvf /tmp/libreoffice/LibreOffice_5.1.0_Linux_x86-64_rpm_helppack_es.tar.gz
cd LibreOffice_5.1.0.3_Linux_x86-64_rpm_helppack_es

# Instalamos todos los paquetes rpm.
dnf install RPMS/*.rpm -y

# Borramos la carpeta donde se encontraban los tres paquetes rpm de LibreOffice,
# y ya tenemos nuestro LibreOffice actualizado a la versión 5.1.0 en español en Fedora 23.
rm -R /tmp/libreoffice

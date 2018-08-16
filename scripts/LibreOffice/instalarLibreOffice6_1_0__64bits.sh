#!/bin/bash
# Autor: josego
# Blog: proyectosbeta.net
# Fecha creacion: 15 de agosto de 2018 a las 19:56 hs.
# Desinstala por completo si se tiene instalado LibreOffice.
# Se instala LibreOffice 6.1.0 en español con su manual de ayuda correspondiente.
apt-get purge libreoffice* -y
apt-get remove libreoffice*
apt-get autoremove -y

# Creamos una carpeta nueva llamada libreoffice en /tmp
cd /tmp/
mkdir libreoffice

# Entramos a la carpeta que recien creamos.
cd libreoffice

# Descargamos los tres paquetes deb para tener instalado LibreOffice en español con su respectiva ayuda.
wget -c http://download.documentfoundation.org/libreoffice/stable/6.1.0/deb/x86_64/LibreOffice_6.1.0_Linux_x86-64_deb.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/6.1.0/deb/x86_64/LibreOffice_6.1.0_Linux_x86-64_deb_langpack_es.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/6.1.0/deb/x86_64/LibreOffice_6.1.0_Linux_x86-64_deb_helppack_es.tar.gz

# Descomprimimos.
tar xzvf LibreOffice_6.1.0_Linux_x86-64_deb.tar.gz
cd LibreOffice_6.1.0.3_Linux_x86-64_deb/DEBS/

# Instalamos todos los paquetes deb de LibreOffice.
dpkg -i *.deb

# Descomprimimos.
tar xzvf /tmp/libreoffice/LibreOffice_6.1.0_Linux_x86-64_deb_langpack_es.tar.gz
cd LibreOffice_6.1.0.3_Linux_x86-64_deb_langpack_es/DEBS/

# Instalamos todos los paquetes deb.
dpkg -i *.deb

# Descomprimimos.
tar xzvf /tmp/libreoffice/LibreOffice_6.1.0_Linux_x86-64_deb_helppack_es.tar.gz
cd LibreOffice_6.1.0.3_Linux_x86-64_deb_helppack_es/DEBS/

# Instalamos todos los paquetes deb del idioma español.
dpkg -i libobasis6.1-es-help_6.1.0.3-3_amd64.deb

# Borramos la carpeta donde se encontraban los tres paquetes deb de LibreOffice.
rm -R /tmp/libreoffice

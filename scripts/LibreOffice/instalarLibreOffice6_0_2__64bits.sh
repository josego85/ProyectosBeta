#!/bin/bash
# Autor: josego
# Blog: proyectosbeta.net
# Fecha: 04 de marzo de 2018 a las 10:50 hs.
# Desinstala por completo si se tiene instalado LibreOffice.
# Se instala LibreOffice Versión: 6.0.2 64b en español con su manual de ayuda 
correspondiente.
apt-get purge libreoffice* -y
apt-get remove libreoffice*
apt-get autoremove -y

# Creamos una carpeta nueva llamada libreoffice en /tmp
cd /tmp/
mkdir libreoffice

# Entramos a la carpeta que recién creamos.
cd libreoffice

# Descargamos los tres paquetes deb para tener instalado LibreOffice en español con su respectiva ayuda.
wget -c http://download.documentfoundation.org/libreoffice/stable/6.0.2/deb/x86_64/LibreOffice_6.0.2_Linux_x86-64_deb.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/6.0.2/deb/x86_64/LibreOffice_6.0.2_Linux_x86-64_deb_langpack_es.tar.gz
wget -c http://download.documentfoundation.org/libreoffice/stable/6.0.2/deb/x86_64/LibreOffice_6.0.2_Linux_x86-64_deb_helppack_es.tar.gz

# Descomprimimos LibreOffice.
tar xzvf LibreOffice_6.0.2_Linux_x86-64_deb.tar.gz
cd LibreOffice_6.0.2.1_Linux_x86-64_deb/DEBS/

# Instalamos todos los paquetes deb de LibreOffice.
dpkg -i *.deb

# Descomprimimos los paquetes deb de nuestro idioma.
tar xzvf /tmp/libreoffice/LibreOffice_6.0.2_Linux_x86-64_deb_langpack_es.tar.gz
cd LibreOffice_6.0.2.1_Linux_x86-64_deb_langpack_es/DEBS/

# Instalamos todos los paquetes deb de nuestro idioma.
dpkg -i *.deb

# Descomprimimos los paquetes deb de la ayuda.
tar xzvf /tmp/libreoffice/LibreOffice_6.0.2_Linux_x86-64_deb_helppack_es.tar.gz
cd LibLibreOffice_6.0.2.1_Linux_x86-64_deb_helppack_es/DEBS/

# Instalamos todos los paquetes deb de la ayuda.
dpkg -i *.deb

# Borramos la carpeta donde se encontraban los tres paquetes deb de LibreOffice
# y ya tendremos nuestro LibreOffice actualizado.
rm -R /tmp/libreoffice

#!/bin/bash
#################################################################################
# Script que descarga varios paquetes para Ubuntu Desktop Zesty Zapus 17.04
# Nombre archivo: descargar_paquetes_ubuntu_zesty_zapus__17_04.sh
# Autor: josego@proyectosbeta.net
# Fecha creacion: 15 de abril de 2017 a las 00:45 hs.
# Fecha actualizacion: -------------
#################################################################################
# Se crea la carpeta ubuntuZestyZapus en el home del usuario actual.
mensaje="Se actualiza los repositorios de Ubuntu Desktop Zesty Zapus 17.04"
echo $mensaje
sudo apt update

# Se actualiza el sistema.
sudo apt upgrade -y

# Utilitarios.
sudo apt install terminator htop synaptic aptitude unetbootin gparted -y

# Escritorio Gnome 3.
sudo apt-get install gnome gnome-shell gnome-weather gnome-music gnome-maps gnome-documents gnome-shell-extensions gnome-tweak-tool gnome-clocks -y

# Escritorio KDE Plasma.
sudo apt install kubuntu-desktop kde-l10n-es kdeartwork gtk2-engines-oxygen gtk2-engines-qtcurve -y 

# Navegadores.
sudo apt install chromium-browser -y
#- Google Chrome


# Multimedia.
sudo apt install gimp gwenview vlc okular youtube-dl pinta -y

# Redes.
sudo apt install net-tools openssh-server filezilla -y

# Programacion.
sudo aptitude install diffuse meld colordiff git -y

# Limpiar paquetes del sistema.
sudo apt autoremove && sudo apt autoclean && sudo apt clean && sudo apt autoremove

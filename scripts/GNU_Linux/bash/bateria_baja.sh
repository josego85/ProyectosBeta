#!/bin/bash
###############################################################
# Autor: josego
# Blog: proyectosbeta.net
# Fecha creacion: 12 de febrero de 2018 a las 21:43 hs.
# Fecha modificacion: -----------------------
# Script que verifica el estado de tu bateria.
# Cuando llega a menos de 30%, envia una notificacion.
###############################################################

BATERIA=`ls /sys/class/power_supply/|grep BAT[0-9]`
POWER=`cat /sys/class/power_supply/$BATERIA/capacity`
CANTIDAD=85
if [ ! $POWER -gt $CANTIDAD ]; then
    notify-send -i /usr/share/icons/Adwaita/256x256/status/battery-caution-charging.png -t 10000 "Aviso de sistema" "Bateria menos de $CANTIDAD %, conecte el cargador"
fi

#!/bin/bash

# Shell script: temp.sh
# Autor original: Santiago Crespo
# Autor modificacion: josego (josego85@gmail.com)
# Fecha modificacion: 31 de diciembre de 2020 a las 22:12 hs.
# Blog: Proyectos Beta
cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
echo "----------------------------------------------------------------------------------------------"
echo "Fecha: $(date)"
echo "Hostname: $(hostname)"
echo "----------------------------------------------------------------------------------------------"
echo "Temperatura CPU => $((cpu/1000))'Cº"
echo "Temperatura GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
echo "CPU $(vcgencmd measure_clock arm)'Hz"
echo "CPU $(vcgencmd measure_volts core)"
echo "Memoria repartida entre el sistema y la gpu:"
echo "Sistema $(vcgencmd get_mem arm)"
echo "GPU $(vcgencmd get_mem gpu)"
echo "Memoria libre $(free -h)"
echo "----------------------------------------------------------------------------------------------"

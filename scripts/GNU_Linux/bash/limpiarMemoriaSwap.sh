#!/bin/bash
echo "Limpiando la caché";
sync ; echo 3 > /proc/sys/vm/drop_caches
echo "Limpiando Swap";
swapoff -a && swapon -a

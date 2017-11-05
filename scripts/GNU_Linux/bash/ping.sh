#!/bin/bash
while :; do
    ping proyectosbeta.net -c 1 $1 && (echo "Ping" | festival --tts) || (echo "Fail" | festival --tts)
done

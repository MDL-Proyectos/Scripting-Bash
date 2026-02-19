#!/bin/bash

# Definimos el nombre del comando final
COMANDO="monitor-salud"

echo "Instalando $COMANDO..."

# 1. Dar permisos de ejecución al script original
chmod +x salud.sh

# 2. Copiarlo a una ruta global (requiere sudo)
sudo cp salud.sh /usr/local/bin/$COMANDO

if [ $? -eq 0 ]; then
    echo "Instalación exitosa."
    echo "Ahora puedes usar el comando '$COMANDO' desde cualquier carpeta."
else
    echo "Falló la instalación."
fi
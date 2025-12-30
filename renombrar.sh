#!/bin/bash

# 1. Capturamos la ruta del archivo que pasamos como argumento ($1)
ARCHIVO_RUTA="$1"

# 2. Verificamos si el archivo realmente existe
if [ ! -f "$ARCHIVO_RUTA" ]; then
    echo "Error: El archivo no existe."
    exit 1
fi

# 3. Obtenemos el nombre del archivo (sin la ruta)
# Ejemplo: /home/user/Fotos/foto.jpg -> foto.jpg
NOMBRE_ARCHIVO=$(basename "$ARCHIVO_RUTA")

# 4. Obtenemos la ruta absoluta de la carpeta donde está el archivo
CARPETA_RUTA=$(dirname "$(realpath "$ARCHIVO_RUTA")")

# 5. Extraemos solo el nombre de la carpeta
# Ejemplo: /home/user/Fotos -> Fotos
NOMBRE_CARPETA=$(basename "$CARPETA_RUTA")

# 6. Definimos el nuevo nombre
NUEVO_NOMBRE="${NOMBRE_CARPETA}_${NOMBRE_ARCHIVO}"

# 7. Renombramos el archivo físicamente
mv "$ARCHIVO_RUTA" "$CARPETA_RUTA/$NUEVO_NOMBRE"

echo "¡Listo! El archivo ha sido renombrado a: $NUEVO_NOMBRE"

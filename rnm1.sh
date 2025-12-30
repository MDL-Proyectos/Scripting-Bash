#!/bin/bash

# 1. Capturamos la carpeta que se pasa como argumento
DIRECTORIO="$1"

# 2. Verificamos que se haya pasado un argumento y que sea una carpeta real
if [ -z "$DIRECTORIO" ] || [ ! -d "$DIRECTORIO" ]; then
    echo "Uso: ./renombrar_todo.sh /ruta/a/la/carpeta"
    exit 1
fi

# 3. Obtenemos el nombre de la carpeta (sin la ruta completa)
NOMBRE_CARPETA=$(basename "$(realpath "$DIRECTORIO")")

echo "Procesando carpeta: $NOMBRE_CARPETA..."

# 4. Bucle para recorrer cada archivo dentro del directorio
for ARCHIVO_RUTA in "$DIRECTORIO"/*; do

    # Verificamos que sea un archivo y no una subcarpeta
    if [ -f "$ARCHIVO_RUTA" ]; then
        
        # Obtenemos el nombre del archivo
        NOMBRE_ORIGINAL=$(basename "$ARCHIVO_RUTA")

        # Evitamos renombrar el archivo si ya empieza con el nombre de la carpeta
        # (Esto evita que el script renombre dos veces el mismo archivo)
        if [[ "$NOMBRE_ORIGINAL" == "${NOMBRE_CARPETA}"_* ]]; then
            echo "Saltando: $NOMBRE_ORIGINAL (ya renombrado)"
            continue
        fi

        # Definimos el nuevo nombre
        NUEVO_NOMBRE="${NOMBRE_CARPETA}_${NOMBRE_ORIGINAL}"
        
        # Renombramos
        mv "$ARCHIVO_RUTA" "$DIRECTORIO/$NUEVO_NOMBRE"
        echo "Renombrado: $NOMBRE_ORIGINAL -> $NUEVO_NOMBRE"
    fi
done

echo "¡Tarea completada!"

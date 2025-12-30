#!/bin/bash

# 1. Definimos la carpeta a organizar
DIR_DESCARGAS="$HOME/Descargas/PRUEBAS"
cd "$DIR_DESCARGAS" || exit

# 2. Contador de archivos movidos
CONTADOR=0

# 3. Empezamos el bucle
# Usamos shopt para que reconozca mayúsculas y minúsculas por igual
shopt -s nocaseglob

for ARCHIVO in *; do
    # Verificamos que sea un archivo y no una carpeta
    if [ -f "$ARCHIVO" ]; then
        
        # Extraemos la extensión
        EXT="${ARCHIVO##*.}"
        
        case "$EXT" in
            jpg|png|jpeg|gif)
                DESTINO="Imagenes" ;;
            pdf|doc|docx|txt|odt)
                DESTINO="Documentos" ;;
            zip|tar.gz|rar|7z)
                DESTINO="Comprimidos" ;;
            mp4|mkv|mov|avi)
                DESTINO="Videos" ;;
            mp3|wav|flac)
                DESTINO="Musica" ;;
            *)
                DESTINO="Otros" ;;
        esac

        # 4. Crear carpeta si no existe y mover
        mkdir -p "$DESTINO"
        mv "$ARCHIVO" "$DESTINO/"
        
        # Incrementamos el contador
        ((CONTADOR++))
    fi
done

# 5. ENVIAR NOTIFICACIÓN A GNOME
if [ $CONTADOR -gt 0 ]; then
    notify-send "Limpieza Completada" "Se han organizado $CONTADOR archivos en tu carpeta de Descargas." --icon=folder-download-symbolic
else
    notify-send "Limpieza" "No había archivos nuevos para organizar." --icon=info
fi

shopt -u nocaseglob

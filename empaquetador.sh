#Empaquetado "Portable" (Hacer un instalador .tar.gz)
# 1. Crear una carpeta limpia para el paquete
mkdir monitor-sistema-1.0

# 2. Copiar tus archivos dentro
cp salud.sh monitor-sistema-1.0/
cp install.sh monitor-sistema-1.0/

# 3. Crear un archivo README sencillo
echo "Para instalar, ejecuta: sudo ./install.sh" > monitor-sistema-1.0/README.txt

# 4. Comprimir todo
tar -czvf monitor-sistema-1.0.tar.gz monitor-sistema-1.0/
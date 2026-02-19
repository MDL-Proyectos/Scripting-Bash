#!/bin/bash

echo "--- REPORTE DE SALUD DEL SISTEMA ---"
date
echo ""

# 1. Uso de Disco (Ver si Postgres tiene espacio)
echo "USO DE DISCO:"
df -h | grep '^/dev/'

echo ""

# 2. Uso de Memoria RAM
echo "MEMORIA RAM:"
free -h

echo ""

# 3. ¿Está corriendo PostgreSQL?
echo "ESTADO DE POSTGRESQL:"
systemctl is-active postgresql

echo ""

# 4. Procesos que más consumen (Top 3)
echo "PROCESOS TOP (CPU):"
ps -eo pcpu,pmem,comm --sort=-pcpu | head -n 4

echo "-------------------------------------"
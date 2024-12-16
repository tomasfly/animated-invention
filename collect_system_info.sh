#!/bin/bash

# Directorio de módulos y archivo de salida
MODULES_DIR="./modules"
OUTPUT_DIR="./output"
OUTPUT_FILE="$OUTPUT_DIR/system_report.txt"

# Crear directorios si no existen
mkdir -p "$MODULES_DIR" "$OUTPUT_DIR"

# Iniciar el reporte
echo "System Report - $(date)" > "$OUTPUT_FILE"
echo "====================================" >> "$OUTPUT_FILE"

# Ejecutar los módulos
for module in "$MODULES_DIR"/*.sh; do
    echo "Running module: $(basename "$module")..."
    bash "$module" >> "$OUTPUT_FILE"
    echo "------------------------------------" >> "$OUTPUT_FILE"
done

echo "Report generated: $OUTPUT_FILE"

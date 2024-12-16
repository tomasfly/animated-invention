#!/bin/bash

# Definir directorios y archivos
PROJECT_DIR="hardware-report"
MODULES_DIR="$PROJECT_DIR/modules"
OUTPUT_DIR="$PROJECT_DIR/output"
README_FILE="$PROJECT_DIR/README.md"
MAIN_SCRIPT="$PROJECT_DIR/collect_system_info.sh"

# Crear estructura de directorios
echo "Creando estructura de directorios..."
mkdir -p "$MODULES_DIR" "$OUTPUT_DIR"

# Crear script principal
echo "Creando el script principal..."
cat << 'EOL' > "$MAIN_SCRIPT"
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
EOL

# Crear módulos individuales
echo "Creando módulos individuales..."
cat << 'EOL' > "$MODULES_DIR/hardware_info.sh"
#!/bin/bash
echo "Hardware Information:"
echo "----------------------"
lshw -short
EOL

cat << 'EOL' > "$MODULES_DIR/memory_info.sh"
#!/bin/bash
echo "Memory Information:"
echo "--------------------"
free -h
echo
vmstat -s
EOL

cat << 'EOL' > "$MODULES_DIR/disk_info.sh"
#!/bin/bash
echo "Disk Information:"
echo "------------------"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
echo
df -h
EOL

cat << 'EOL' > "$MODULES_DIR/cpu_info.sh"
#!/bin/bash
echo "CPU Information:"
echo "-----------------"
lscpu
echo
cat /proc/cpuinfo | grep "model name" | uniq
EOL

cat << 'EOL' > "$MODULES_DIR/network_info.sh"
#!/bin/bash
echo "Network Information:"
echo "---------------------"
echo "Interfaces:"
ip addr show
echo
echo "Routing Table:"
ip route show
echo
echo "Active Connections:"
netstat -tunlp
EOL

# Crear archivo README.md
echo "Creando README.md..."
cat << 'EOL' > "$README_FILE"
# Hardware Report Script

Este proyecto genera un reporte detallado del sistema con información de hardware, software, memoria, disco, CPU y red.

## Estructura del Proyecto
- `collect_system_info.sh`: Script principal que coordina todos los módulos.
- `modules/`: Contiene los scripts para recopilar información específica.
  - `hardware_info.sh`: Información de hardware.
  - `memory_info.sh`: Información de memoria.
  - `disk_info.sh`: Información de disco.
  - `cpu_info.sh`: Información de CPU.
  - `network_info.sh`: Información de red.
- `output/`: Carpeta donde se almacena el archivo de reporte.
- `README.md`: Este archivo.

## Requisitos
- Bash
- Herramientas estándar de Linux como `lshw`, `free`, `df`, `lscpu`, `ip`, `netstat`, etc.

## Uso
1. Clona o descarga este proyecto.
2. Da permisos de ejecución a los scripts:
   ```bash
   chmod +x collect_system_info.sh modules/*.sh
```

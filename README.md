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

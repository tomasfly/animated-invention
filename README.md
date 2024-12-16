# Hardware Report Script

This project generates a detailed system report with information about hardware, software, memory, disk, CPU, and network.

## Project Structure
- **`collect_system_info.sh`**: Main script that coordinates all modules.
- **`modules/`**: Contains the scripts for specific information collection.
  - **`hardware_info.sh`**: Hardware information.
  - **`memory_info.sh`**: Memory information.
  - **`disk_info.sh`**: Disk information.
  - **`cpu_info.sh`**: CPU information.
  - **`network_info.sh`**: Network information.
- **`output/`**: Folder where the report file is stored.
- **`README.md`**: This file.

## Requirements
- Bash
- Standard Linux tools like:
  - `lshw`
  - `free`
  - `df`
  - `lscpu`
  - `ip`
  - `netstat`

## Usage
1. Clone or download this project.
2. Grant execution permissions to the scripts:
   ```bash
   chmod +x collect_system_info.sh modules/*.sh
   ```
3. Run:
   ```bash
   bash ./collect_system_info.sh
   ```

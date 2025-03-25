#!/bin/bash

# Actualizar la lista de paquetes
sudo apt-get update

#Permiso para utilizar el puerto serie
sudo usermod -a -G dialout $USER

#Permiso para acceder a dispositivo de entrada  (Escaner)
sudo usermod -aG input $USER

# Instalar librerías
sudo apt-get install -y variety
sudo apt install -y git
sudo apt install -y python3-dev libpq-dev libevdev-dev build-essential
sudo apt-get install -y python3-tk
sudo apt-get install -y python3-pil.imagetk
sudo apt-get install -y libxcb-cursor0
sudo apt-get install -y libxcb-xinerama0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-shape0 libxcb-xfixes0
#sudo apt-get install -y qt5-default python3-pyqt5
sudo apt install -y libfontconfig1 mesa-common-dev libglu1-mesa-dev
sudo apt install -y qtbase5-dev qttools5-dev-tools #  qtcreator
sudo apt-get install -y gparted
sudo apt install -y net-tools
sudo apt-get install -y nmap
sudo apt install -y ffmpeg
sudo apt-get install -y libportaudio2
sudo apt install -y portaudio19-dev
sudo apt-get install -y pulseaudio
sudo apt install -y arp-scan
sudo apt install -y postgresql postgresql-contrib
sudo apt install -y redis-server

# Instalar the gimp
sudo apt install -y gimp

# Instalar the inkscape
#sudo apt install -y inkscape

# Instalar curl
sudo apt install -y curl


sudo apt autoremove -y

sudo apt update --fix-missing
sudo apt install -f

# Deshabilitar shortcut del teclado, para que vscode lo ocupe
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"

# Instalar Node
sudo apt-get install -y nodejs
sudo apt install -y npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

# Instalar Angular
sudo npm install -g @angular/cli


# python
# Instalar requirements
SCRIPT_DIR=$(dirname "$0")
VENV_DIR="$SCRIPT_DIR/venv"
REQUIREMENTS_FILE="$SCRIPT_DIR/requirements.txt"

# Verificar si el entorno virtual existe y crear si no
if [[ ! -d "$VENV_DIR" ]]; then
   echo "El directorio del entorno virtual no existe. Creando entorno virtual en $VENV_DIR"
   python3 -m venv "$VENV_DIR"
   if [[ $? -ne 0 ]]; then
       echo "Error al crear el entorno virtual"
       exit 1
   fi
fi

# Activar el entorno virtual
source "$VENV_DIR/bin/activate"

# Confirmar que el entorno virtual está activado
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Entorno virtual activado en $VIRTUAL_ENV"
else
    echo "Fallo al activar el entorno virtual"
    exit 1
fi

# Verificar si el archivo requirements.txt existe
if [[ ! -f "$REQUIREMENTS_FILE" ]]; then
    echo "El archivo requirements.txt no existe en $SCRIPT_DIR"
    exit 1
fi

# Actualizar pip e instalar requirements
pip install --upgrade pip
pip install -r "$REQUIREMENTS_FILE"


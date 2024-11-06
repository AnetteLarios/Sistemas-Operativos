#!/usr/bin/bash

#LARIOS GONZALEZ ANETTE PAOLA 218544644
export PATH=$PATH:/usr/bin

#Muestra un mensaje por cada valor de la máquina virtual para que el usuario los inserte
read -p "Ingrese el nombre de la máquina virtual: " nombre_vm
read -p "Ingrese el sistema operativo (ej: Linux_64): " sistema_operativo
read -p "Ingrese el número de CPUs: " cpus
read -p "Ingrese la memoria RAM en MB: " ram
read -p "Ingrese la memoria VRAM en MB: " vram
read -p "Ingrese el tamaño del disco duro en MB: " size_disco
read -p "Ingrese el nombre del controlador SATA: " controlador_sata
read -p "Ingrese el nombre del controlador IDE: " controlador_ide

# Genera la máquina virtual con el nombre y sistema operativo que el usuario escogio
vboxmanage createvm --name "$nombre_vm" --ostype "$sistema_operativo" --register

# Configura los CPU, memoria y ram que va a tener la máquina virtual
vboxmanage modifyvm "$nombre_vm" \
  --cpus "$cpus" \
  --memory "$ram" \
  --vram "$vram"

# Crea el disco duro dela máquina virtual (HD->Hard Drive) y le asiga el tamaño que el usuario seleccionó
vboxmanage createhd --filename "$nombre_vm.vdi" --size "$size_disco"

# Creación y configuración del controlador SATA y lo asocia al HD
vboxmanage storagectl "$nombre_vm" --name "$controlador_sata" --add sata --controller IntelAhci
vboxmanage storageattach "$nombre_vm" --storagectl "$controlador_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Creación y configuración del controlador IDE para CD/DVD
vboxmanage storagectl "$nombre_vm" --name "$controlador_ide" --add ide
VBoxManage storageattach "$nombre_vm" --storagectl "$controlador_ide" --port 0 --device 0 --type dvddrive --medium emptydrive


# Muestra resumen de la configuración
echo "La máquina virtual creada exitosamente:"
vboxmanage showvminfo "$nombre_vm" | grep -E 'name|OS|cpus|memory|vram|SATA|IDE'
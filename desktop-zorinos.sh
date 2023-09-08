#!/usr/bin/env bash
#
# wget https://raw.githubusercontent.com/paulogobetti/scripts/main/desktop-zorinos-desktop.sh -O /home/$USER/install.sh && chmod +x install.sh && ./install.sh
#
# # # #

APPS_SNAP_REMOVE=( )

APPS_APT_REMOVE=( snapd )

APPS_APT_INSTALL=( )

APPS_FLATPAK_INSTALL=( com.github.libresprite.LibreSprite, com.obsproject.Studio, com.snes9x.Snes9x, com.unity.UnityHub, com.usebottles.bottles, com.vscodium.codium, io.github.shiftey.Desktop, io.lmms.LMMS, io.mgba.mGBA, net.blockbench.Blockbench, org.blender.Blender, org.chromium.Chromium, org.filezillaproject.Filezilla, org.mapeditor.Tiled, org.mozilla.firefox )

set -e

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt upgrade -y

sudo dpkg --add-architecture i386

# Pegar última versão do VirtualBox de maneira dinâmica.
wget https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT && RELEASE_VERSION="$(cat LATEST-STABLE.TXT)" && rm LATEST-STABLE.TXT

DOWNLOAD_LINK="https://download.virtualbox.org/virtualbox/$RELEASE_VERSION/"

mkdir /home/$USER/.tmp

wget -r -np -nH -A "virtualbox-*_$RELEASE_VERSION*Ubuntu~focal_amd64.deb" $DOWNLOAD_LINK -O /home/$USER/.tmp/virtualbox.deb

# Remover snaps.

# Remover snap-store/snapd.

# Remover GNOME 3.
# Instalar GNOME 4.
# Integrar GNOME 4.

# Add transparência gnome top-bar.

# Add custom cursor.

# Add custom icons.

# Instalar GNOME Tweaks

# Instalar flatpaks.

# Instalar miniaturas.

# Configurar aliases.
# VBoxManage

# Configurar iptables.
# Bloquear ping.
# Habilitar firewall.

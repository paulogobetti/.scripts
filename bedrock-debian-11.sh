#!/usr/bin/env bash
#
#   wget https://raw.githubusercontent.com/paulogobetti/scripts/main/bedrock-debian-11.sh -O /home/$USER/install.sh && chmod +x install.sh && ./install.sh
#
#   curl -L https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.12.01.zip --output ./bedrock.zip && tar -Jxf bedrock.zip -C ./bedrock-server
#
# # # #

LOCAL_IP="$(hostname -I | cut -f1 -d' ')"

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt upgrade -y

sudo apt install ufw ssh screen -y

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 19132
sudo ufw enable

# Criar alias.
# $HOME/.bashrc
#alias bedrock up="$HOME/.bedrock-server/bedrock_server"

#mkdir /home/$USER/.bedrock-server && curl -L https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.12.01.zip --output /home/$USER/.bedrock-server/bedrock.zip && unzip /home/$USER/.bedrock-server/bedrock.zip -d /home/$USER/.bedrock-server/ && rm -rf /home/$USER/.bedrock-server/bedrock.zip && baixar configuração pronta && criar alias

# Habilitar server e painel na inicialização.
#sudo systemctl enable bedrock_server

# Gerar certificado SSL auto-assinado (OpenSSL).

# Setar IP estático.

# Aumentar o limite de user watches do servidor.
echo fs.inotify.max_user_watches=681984 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo "Instalação finalizada com sucesso."
echo "Anote sua senha e acesse o painel em $LOCAL_IP, Senha: $PASS"

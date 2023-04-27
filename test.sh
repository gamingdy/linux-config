 #!/bin/bash

apt update
apt upgrade -y

apt install -y  sudo
usermod -aG sudo username
su -u username


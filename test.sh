 #!/bin/bash

apt update
apt upgrade -y

apt install -y  sudo
usermod -aG sudo username
su -u username

# Ensure that apt can handle HTTPS sources:
apt install apt-transport-https gpg -y

# Add Sublime Text repository signing key to verify downloaded packages:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Stable releases of Sublime Text:
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# update apt list for sublime text
apt update

apt install sublime-text -y
copyq importData copyq.data


curl -s https://julianfairfax.codeberg.page/package-repo/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/julians-package-repo.gpg
echo 'deb [ signed-by=/usr/share/keyrings/julians-package-repo.gpg ] https://julianfairfax.codeberg.page/package-repo/debs packages main' | sudo tee /etc/apt/sources.list.d/julians-package-repo.list

sudo apt install playerctl

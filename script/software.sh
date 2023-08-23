# File Manager (eg. pcmanfm,krusader,thunar)

printf "\e[1;32mInstalling filemanager.\e[0m\n"
sudo apt install -y nautilus

# alacritty Terminal
# repo url of debian build
# https://github.com/barnumbirr/alacritty-debian/tree/master

printf "\e[1;32mInstalling alacritty.\e[0m\n"
wget https://github.com/barnumbirr/alacritty-debian/releases/download/v0.12.0-1/alacritty_0.12.0_amd64_bullseye.deb
sudo apt install -y ./alacritty_0.12.0_amd64_bullseye.deb

# Browser Installation (eg. chromium)
#printf "\e[1;32mInstalling browser.\e[0m\n"
# if you want firefox
# sudo apt install -y firefox-esr
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt install -y ./google-chrome-stable_current_amd64.deb
#sudo rm ./google-chrome-stable_current_amd64.deb


printf "\e[1;32mInstalling Sublime Text.\e[0m\n"
# Ensure that apt can handle HTTPS sources:
sudo apt install apt-transport-https gpg -y

# Add Sublime Text repository signing key to verify downloaded packages:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Stable releases of Sublime Text:
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# update apt list for sublime text and installing sublime text
sudo apt update

sudo apt install sublime-text -y

# Discord Installation
#printf "\e[1;32mInstalling discord.\e[0m\n"
#wget --show-progress -O discord.deb https://discord.com/api/download?platform=linux&format=deb
#sudo apt install -y ./discord.deb
#sudo rm ./discord.deb


# Termius installation
printf "\e[1;32mInstalling Termius.\e[0m\n"
wget --show-progress -O  termius.deb https://autoupdate.termius.com/linux/Termius.deb
sudo apt install -y ./termius.deb
sudo rm ./termius.deb

# Docker installation
printf "\e[1;32mInstalling Docker.\e[0m\n"
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

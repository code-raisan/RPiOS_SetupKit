# Update
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade

# Install
sudo apt install -y vim python3-pip
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install glances

# Firmware Update
sudo rpi-update -y

# Reboot
printf "\x1b[31m%s\x1b[0m" "Warning: Reboot after 5s !"
sleep 10s
sudo reboot

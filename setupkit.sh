# Update
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade

# Install
sudo apt install -y vim python3-pip
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install glances

# Firmware Update
sudo rpi-update

# Reboot
echo "\x1b[31mWarning: Reboot after 5s !\x1b[0m"
sleep 10s
sudo reboot

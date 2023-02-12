# Init
apt update && apt upgrade
apt install dnsmasq
systemctl stop dnsmasq
systemctl stop dhcpcd

# DHCP Setup
echo "denyinterfaces eth0" >> /etc/dhcpcd.conf
systemctl start dhcpcd

# DNS Setup
cp /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
echo <<EOS
server=192.168.0.1
interface=eth0
dhcp-range=192.168.2.1,192.168.2.254,255.255.255.0,6h
EOS >>  /etc/dnsmasq.conf
sudo systemctl start dnsmasq

# IP Forward Setup
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT
sh -c "iptables-save > /etc/iptables.ipv4.nat"

# Auto Setting
cmd <<EOS
sudo ifconfig eth0 192.168.4.1
iptables-restore < /etc/iptables.ipv4.nat
exit 0
EOS
sed -i s/exit 0/${cmd}/ /etc/rc.local

# Reboot
printf "\n\n\x1b[31m%s\x1b[0m" "Warning: Reboot after 5s !"
sleep 5s
reboot

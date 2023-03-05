#!/bin/bash
# DevCops - Peter Mikaczo 2023

CONFIG_PATH="/provision"

sudo apt update -y
sudo apt install isc-dhcp-server -y

cp $CONFIG_PATH/dhcpd.conf /etc/dhcp/dhcpd.conf
cp $CONFIG_PATH/isc-dhcp-server /etc/default/isc-dhcp-server
sudo systemctl restart isc-dhcp-server
sudo systemctl start isc-dhcp-server
#sudo systemctl status isc-dhcp-server

###############Install TFTP

sudo apt-get install tftpd-hpa tftp-hpa -y

cp $CONFIG_PATH/tftpd-hpa /etc/default/tftpd-hpa

sudo systemctl enable tftpd-hpa
sudo systemctl restart tftpd-hpa
#sudo systemctl status tftpd-hpa

mkdir -p /srv/tftp/
cd /srv/tftp/
mkdir source && cd source
wget https://github.com/chenall/grub4dos/releases/download/0.4.6a/grub4dos-0.4.6a-2023-03-01.7z
sudo apt-get install p7zip -y
7zr e grub4dos-0.4.6a-2023-03-01.7z
cp grldr /srv/tftp/


###############add menu.lst and memtest
mkdir -p /srv/tftp/memtest
cd /srv/tftp/memtest/
wget https://www.memtest.org/download/v6.10/mt86plus_6.10.binaries.zip
sudo apt-get install unzip
unzip mt86plus_6.10.binaries.zip



#apache:

sudo apt install apache2 -y

sudo systemctl enable apache2
sudo systemctl restart apache2

cp $CONFIG_PATH/000-default.conf /etc/apache2/sites-available/000-default.conf
cp $CONFIG_PATH/apache2.conf /etc/apache2/apache2.conf
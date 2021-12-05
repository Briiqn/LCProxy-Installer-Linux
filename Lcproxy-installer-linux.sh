#!/bin/sh

if [[ $EUID -eq 0 ]]; then
    echo -e ${RED}ERROR "Do not run this as root idiot"
    exit 1
elif [ -d "/home/$USER/.lunarclient" ]; then
echo ______________________
echo Starting Installer ...
echo ______________________
sleep 2;
cd ~/.lunarclient/jre/zulu*/lib/security
wget https://assets.lunarproxy.me/server.cer && mv server.cer ~/Downloads
clear
echo _____________________________________
echo TRUST THE CERTIFICATE BY TYPING YES
echo _____________________________________
keytool -keystore cacerts -trustcacerts -importcert -alias lcproxy -storepass changeit -file ~/Downloads/server.cer
wget https://raw.githubusercontent.com/Briiqn/LCProxy-Installer-Linux/main/hosts && mv hosts ~/Downloads
mkdir ~/host-backup
sudo cp /etc/hosts ~/host-backup
echo Created hosts backup @ "/home/*/host-backup"
sudo cp ~/Downloads/hosts /etc/
clear
echo done! Rebooting is recommended
#cool song
sleep 5;
kill -9 $PPID
else
echo ERROR! please install/reinstall lunar and run it or check your internet connection
fi

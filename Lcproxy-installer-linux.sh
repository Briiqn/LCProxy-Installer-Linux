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
#test
keytool -keystore cacerts -trustcacerts -importcert -alias lcproxy -storepass changeit -file ~/Downloads/server.cer
echo server certificate test complete
mkdir ~/LCP
wget https://raw.githubusercontent.com/Briiqn/LCProxy-Installer-Linux/main/hosts && mv hosts ~/Downloads
wget https://raw.githubusercontent.com/Briiqn/LCProxy-Installer-Linux/main/Lcproxy-injector-linux.sh && mv Lcproxy-injector-linux.sh ~/LCP
wget https://raw.githubusercontent.com/Briiqn/LCProxy-Installer-Linux/main/Lcproxy-injector-linux.sh.desktop && mv Lcproxy-injector-linux.sh.desktop ~/.config/autostart
mkdir ~/host-backup
sudo cp /etc/hosts ~/host-backup
echo Created hosts backup @ "/home/*/host-backup"
sudo cp ~/Downloads/hosts /etc/
clear
rm ~/Downloads/hosts
echo done! Rebooting is recommended
echo You will find the injector in "/home/$USER/LCP"
echo autostarting injector in 5 seconds
sleep 1;
echo autostarting injector in 4 seconds
sleep 1;
echo autostarting injector in 3 seconds
sleep 1;
echo autostarting injector in 2 seconds
sleep 1;
echo autostarting injector in 1 seconds
sleep 1;
clear
echo starting
cd ~/
chmod ugo+rwx ~/LCP/Lcproxy-injector-linux.sh
./LCP/Lcproxy-injector-linux.sh
#cool song
sleep 5;
kill -9 $PPID
else
echo ERROR! please install/reinstall lunar and run it or check your internet connection
fi

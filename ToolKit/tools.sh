#!/gearlock/bin/bash

if [[ ! -f /data/.ToolKit/webviewbak/webview.apk ]];then
clear ; sleep 0.5
figlet -w $(tput cols) -c "Initializing" sleep 0.5; echo ; 
cp /system/priv-app/webview/webview.apk /data/.ToolKit/webviewbak/
cp /system/fonts/* /data/.ToolKit/customization/baks/stockfonts/fonts/
cp -R /data/app/ch.deletescape.lawnchair.plah-1 /data/.ToolKit/customization/baks/launcher/
cp -R /data/data/ch.deletescape.lawnchair.plah /data/.ToolKit/customization/baks/launcher/
fi

gecpc "MAIN-MENU"
figlet -w $(tput cols) -c "ToolKit"
gecpc "HEHE"; echo
geco "${GREEN}1.Game-Tweaks${RC}"
geco "${GREEN}2.Essential-Apks${RC}"
geco "${GREEN}3.System-Tweaking-Apks${RC}"
geco "${GREEN}4.Customization${RC}"
geco "${GREEN}5.Restore.${RC}"
geco "${GREEN}6.FileManager-(Terminal)${RC}"
geco "${GREEN}7.Get-Logs(Logcat.lsmod..)${RC}"
geco "${RED}8.exit??${RC}"
echo -e "\e[93;1m"
read -p "choose an option : " choice
echo -e "\e[0m"
if [ $choice = 1 ];then
bash /data/.ToolKit/game-tweaks/whichgame.sh
fi

if [ $choice = 2 ];then
bash /data/.ToolKit/apks/apk-install.sh
fi


if [ $choice = 4 ];then
bash /data/.ToolKit/customization/customz.sh
fi

if [ $choice = 5 ];then
clear; sleep 0.5 
figlet -w $(tput cols) -c "Restore" ; echo 
geco "${GREEN}1.Restore Stock Web-view${RC}"
geco "${GREEN}2.Restore Stock Framework/cursor${RC}"
geco "${GREEN}3.Restore stock Fonts${RC}"
#echo -e "\e[32m4.----\e[0m "
echo -e "\e[93;1m"
read -p "choose an option : " choice
echo -e "\e[0m"


if [ $choice = 1 ];then
geco "Restoring-stock-webview..!\n"
nout rm -rf /system/priv-app/webview/webview.apk
nout cp /data/.ToolKit/webviewbak/webview.apk /system/priv-app/webview/
chmod 777 /system/priv-app/webview/webview.apk
read -n 1 -s -r -p "Restore Complete!!--Press Enter To Continue"
geco "Rebooting..!"
sleep 2
reboot
fi

if [ $choice = 2 ];then
geco "Restoring-stock-webview..!\n"
nout rm -rf /system/framework/framework-res.apk
nout cp /data/.ToolKit/frameworkbak/framework-res.apk /system/framework/
chmod 777 /system/framework/framework-res.apk
read -n 1 -s -r -p "Restore Complete!!--Press Enter To Continue"
geco "Rebooting..!"
sleep 2
reboot
fi

if [ $choice = 3 ];then
geco "Restoring-stock-Fonts..!\n"
nout rm -rf /system/font/*
nout cp data/.ToolKit/customization/baks/stockfonts/fonts/* /system/fonts/
chmod 777 /system/fonts/*
chmod +x /system/fonts/*
read -n 1 -s -r -p "Restore Complete!!--Press Enter To Continue"
geco "Rebooting"
sleep 2
reboot
fi




fi

if [ $choice = 6 ];then
read -n 1 -s -r -p "To Exit FileManager Press F10 (Press Enter To Continue)"
mc
fi

if [ $choice = 7 ];then
nout rm -rf data/Logs
nout rm -rf /data/Logs
nout mkdir /data/Logs
timeout 4 logcat > data/Logs/Logcat.txt
lsmod > /data/Logs/lsmod.txt
dmesg > /data/Logs/dmesg.txt
read -n 1 -s -r -p "Finished collecting logs..(Press Enter To Continue)"
fi


if [ $choice = 8 ];then
exit 69
fi

if [ $choice = 3 ];then
bash /data/.ToolKit/system-tweaks/sys-tweaks.sh
fi




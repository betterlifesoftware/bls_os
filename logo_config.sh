#!/bin/sh
filename='/boot/cmdline.txt'
line=$(head -n 1 $filename)
partUUID=$(echo $line | cut -c14-38)
echo $partUUID
str1=' console=tty3 '
str2=' rootfstype=ext4 elevator=deadline fsck.repair=yes quiet rootwait quiet net.ifnames=0 plymouth.ignore-serial-consoles logo.nologo vt.global_cursor_default=0 rd.plymouth=0 plymouth.enable=0 consoleblank=0 quiet loglevel=0 quiet rd.systemd.show_status=false rd.udev.log_level=0 udev.log_level=0 plymouth.ignore-serial-consoles rd.udev.log-priority=3 udev_log=3'
newline=$str1$partUUID$str2
echo $newline > $filename
cd /home/dietpi
if test ! -f '/home/dietpi/splash.jpg'; then
        wget 'https://raw.githubusercontent.com/betterlifesoftware/bls_os/master/splash.jpg'
fi
if [ $(dpkg-query -W -f='${Status}' fbi 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install -y fbi;
fi
cd /etc/systemd/system
if test ! -f '/etc/systemd/system/splashscreen.service'; then
        wget 'https://raw.githubusercontent.com/betterlifesoftware/bls_os/8d05f1e11c7c95269003415d26714d07db277fc6/splashscreen.service'
        sudo systemctl enable splashscreen
fi
touch ~/.hushlogin

#!/bin/sh
rm /boot/dietpi/func/dietpi-banner
sed -i '256d' /boot/dietpi/dietpi-login
sed -i '237d' /boot/dietpi/dietpi-login
sed -i '99d' /boot/dietpi/dietpi-login
sed -i '18109d' /boot/dietpi/dietpi-software
sed -i '18104d' /boot/dietpi/dietpi-software
sed -i '47d' /boot/dietpi/postboot

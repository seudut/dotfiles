#!/bin/bash -xe

# stop hostapd
systemctl stop hostapd || true

# stop dns server
killall dnsmasq || true

# stop dhcp client
killall dhcpcd || true

sleep 1

# start dhcp
dhcpcd

sleep 3

# scan wifi
wpa_cli -i wlan0 scan

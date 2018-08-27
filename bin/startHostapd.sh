#!/bin/bash -xe

# This tool is to enable Hotspot mode on Raspberry Pi
# Refer https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md#internet-sharing

# disable WiFi connection
wpa_cli -i wlan0 disable_network 0 || true

# Stop dhcp cliennt, will start it with static IP and no wpa_supplicant
systemctl stop dhcpcd || true
killall dhcpcd || true

# start Hostapd mode
systemctl start hostapd

# start dhcp client with static IP
dhcpcd --static ip_address=192.168.4.1/24 --nohook wpa_supplicant wlan0

# start dnsmasq, dns server with IP reanges
dnsmasq --interface=wlan0 --dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h

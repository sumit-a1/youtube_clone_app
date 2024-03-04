#!/bin/bash

sudo apt update -y
wget -O splunk-9.1.1-64e843ea36b1-linux-2.6-amd64.deb "https://download.splunk.com/products/splunk/releases/9.1.1/linux/splunk-9.1.1-64e843ea36b1-linux-2.6-amd64.deb"
sudo dpkg -i splunk-9.1.1-64e843ea36b1-linux-2.6-amd64.deb
sudo /opt/splunk/bin/splunk enable boot-start

# usernme splunk
# password splunk

sudo ufw allow openSSH
sudo ufw allow 8000
sudo ufw status
sudo ufw enable
sudo /opt/splunk/bin/splunk start

# <splunk-public-ip:8000>
# Install splunk App for Jenkins in splunk dashboard search

sudo ufw allow 8088
sudo ufw status

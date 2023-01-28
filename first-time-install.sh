#!/bin/bash

set -xeuf -o pipefail

sudo apt install php8.1 net-tools

if [ ! -d "/opt/lampp" ]; then
    wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.25/xampp-linux-x64-8.0.25-0-installer.run

    chmod a+x xampp-linux-x64-8.0.25-0-installer.run

    sudo ./xampp-linux-x64-8.0.25-0-installer.run
else
    echo "Xammp already installed!"
fi

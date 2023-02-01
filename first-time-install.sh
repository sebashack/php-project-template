#!/bin/bash

set -xeuf -o pipefail

export ROOT="$( readlink -f "$( dirname "${BASH_SOURCE[0]}" )" )"
export INSTALL_DIR=$ROOT/_install

rm -rf  $INSTALL_DIR/style
mkdir -p $INSTALL_DIR/style

sudo apt update
sudo apt install -y php8.1 net-tools php-xmlwriter wget

if [ ! -d "/opt/lampp" ]; then
    cd $INSTALL_DIR

    wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.25/xampp-linux-x64-8.0.25-0-installer.run

    chmod a+x xampp-linux-x64-8.0.25-0-installer.run

    sudo ./xampp-linux-x64-8.0.25-0-installer.run

    cd -
else
    echo "Xammp already installed!"
fi

cd $INSTALL_DIR/style

wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer

cd -

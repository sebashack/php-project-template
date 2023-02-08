#!/bin/bash

set -xeuf -o pipefail

export ROOT="$( readlink -f "$( dirname "${BASH_SOURCE[0]}" )" )"
export INSTALL_DIR=$ROOT/_install

rm -rf  $INSTALL_DIR/style
mkdir -p $INSTALL_DIR/style

sudo apt update
sudo apt install -y php8.1 php8.1-curl net-tools php-xmlwriter wget

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

# Install composer
if [ ! -d "$INSTALL_DIR/composer" ]; then
    rm -rf $INSTALL_DIR/composer
    mkdir -p $INSTALL_DIR/composer

    cd $INSTALL_DIR/composer

    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
    then
        >&2 echo 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet
    RESULT=$?

    rm composer-setup.php

    cd -
fi

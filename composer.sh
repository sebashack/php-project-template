#!/bin/bash

export ROOT="$( readlink -f "$( dirname "${BASH_SOURCE[0]}" )" )"
export INSTALL_DIR=$ROOT/_install

php $INSTALL_DIR/composer/composer.phar

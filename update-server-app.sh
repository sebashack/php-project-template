#!/bin/bash

export ROOT="$( readlink -f "$( dirname "${BASH_SOURCE[0]}" )" )"

sudo rm -rf /opt/lampp/htdocs/app
sudo cp -r $ROOT/app /opt/lampp/htdocs
sudo /opt/lampp/lampp restart

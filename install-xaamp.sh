#!/bin/bash

set -xeuf -o pipefail

wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.25/xampp-linux-x64-8.0.25-0-installer.run

chmod a+x xampp-linux-x64-8.0.25-0-installer.run

sudo ./xampp-linux-x64-8.0.25-0-installer.run

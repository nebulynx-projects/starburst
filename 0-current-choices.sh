#!/bin/bash
#set -e
##################################################################################################################
#tput setaf 0 = black 
#tput setaf 1 = red 
#tput setaf 2 = green
#tput setaf 3 = yellow 
#tput setaf 4 = dark blue 
#tput setaf 5 = purple
#tput setaf 6 = cyan 
#tput setaf 7 = gray 
#tput setaf 8 = light blue
##################################################################################################################

# Detect OS and set flags
OS=""
if grep -qi "arch" /etc/os-release; then
    OS="arch"
elif grep -qi "debian" /etc/os-release; then
    OS="debian"
fi

# Show detected OS
tput setaf 6
echo "################################################################################"
echo "Detected OS: ${OS:-unknown}"
echo "################################################################################"
tput sgr0

if [[ "$OS" == "arch" ]]; then
    echo "Running Arch Linux setup steps..."
    # your pacman install section goes here
    sh 100-base-arch.sh
fi

if [[ "$OS" == "debian" ]]; then
    echo "Running Debian setup steps..."
    # your apt install section goes here
    sh 100-base-debian.sh
fi

#!/bin/bash

echo "This script will install the kali tools on this machine."
echo "Therefore, it will delete the old sources list!"
read -r -p "Do you want to continue? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]] then
	echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
	apt-get update
	apt-get -y install kali-archive-keyring
	apt-get update
	clear
	echo "Successfully configured apt to use the kali repository instead of the debian ones :)"
	echo "Kali has several toolsets, so called Metapackages."
	echo "Here's a list of them:"
	apt-cache search kali-linux
	echo ""
	read -r -p "Which metapackage do you want to install? " meta
	apt-get -y install $meta
fi
echo "Have a nice day :)"

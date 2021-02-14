#!/bin/bash
################################################################################################################################
####					Installing Sublime Text with apt						                                                                 	####
###############################################################################################################################

## Install the GPG key:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

## Ensure apt is set to work with https sources
sudo apt-get install -y apt-transport-https

## Add stable
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-test.list

## Update apt sources and install Sublime text
sudo apt-get update
sudo apt-get install -y sublime-text
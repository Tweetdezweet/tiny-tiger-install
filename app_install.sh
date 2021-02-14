#!/bin/bash

################################################################################################################################
####        Installing darktable with apt		   	                                                                   					####
###############################################################################################################################
sudo apt-get install -y darktable


################################################################################################################################
####					Installing Git with apt								                                                                        ####
###############################################################################################################################
sudo apt-get install -y git

################################################################################################################################
####					Installing Filezilla with apt								                                                                  ####
###############################################################################################################################
sudo apt-get install -y filezilla


################################################################################################################################
####					Installing MySQL Workbench with apt					                                                               		####
###############################################################################################################################
sudo apt-get install -y mysql-workbench-community


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


################################################################################################################################
####					Installing PhpStorm as a snap package							                                                           ####
###############################################################################################################################

sudo snap install phpstorm-classic


################################################################################################################################
####						Installing Local								                                                                            ####
###############################################################################################################################

## get file from: https://cdn.localwp.com/releases-stable/5.9.8+5191/local-5.9.8-linux.deb

wget -qO - https://cdn.localwp.com/releases-stable/5.9.8+5191/local-5.9.8-linux.deb | sudo apt install -y -

################################################################################################################################
####					Installing Chrome and it's extensions			                                                             				####
###############################################################################################################################

install_chrome_extension () {
  preferences_dir_path="/opt/google/chrome/extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

if ! which "google-chrome" ; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
  | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt-get update
  sudo apt install -y google-chrome-stable
else
  echo Chrome already installed
fi

install_chrome_extension "aeblfdkhhhdcdjpifhhbdiojplfjncoa" "1 password"
install_chrome_extension "chklaanhfefbnpoihckbnefhakgolnmc" "JSONView"
install_chrome_extension "gighmmpiobklfepjocnamgkkbiglidom" "AdBlock"


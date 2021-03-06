#!/bin/bash

################################################################################################################################
####        Installing darktable with apt		   	                                                                   					####
###############################################################################################################################
sudo apt-get install -y darktable


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


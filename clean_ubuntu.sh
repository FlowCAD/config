#!/bin/sh
echo "---Clean - Start---\n"

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove
echo "\n--Cache nettoyé--\n"
sleep 3

find ~/.thumbnails -type f -atime +7 -exec rm {} \;
echo "\n--Icônes supprimés--\n"
rm -r -f ~/.local/share/Trash/files/*
echo "\n--Corbeille vidée--\n"
sleep 3

find ~/ -name '*~' -exec rm {} \;
echo "\n--Tmp files (terminant par ~, du dossier HOME) supprimés--\n"
sleep 3

docker system prune -f --volumes
echo "\nObjets Docker inutilisés retirés\n"
sleep 3

docker image prune -f
echo "\nImages Docker retirées\n"

docker volume prune -f
echo "\nVolume Docker retirées\n"

docker system df

echo "\n---Clean - End---"

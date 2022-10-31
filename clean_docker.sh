#!/bin/sh
echo "---Docker Stop and Remove - Start---\n"

docker container stop $(docker container ls -aq)
echo "\n--Containers stopped--\n"
sleep 3

docker container rm $(docker container ls -aq)
echo "\n--Containers removed--\n"

echo "\n---Docker Stop and Remove - End---"

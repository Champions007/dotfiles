#!/bin/bash

Running(){
    sudo apt-get update
}
Bar(){
while [ 1 ]; do
echo -e -n '|\r\c'
sleep 1
echo -e -n '/\r\c'
sleep 1
echo -e -n '-\r\c'
sleep 1
echo -e -n '\\\r\c'
sleep 1
done
}

echo -n "Updating package lists..."; Running > /dev/null; echo " done."

#!/bin/bash

install_package(){
# echo "Please enter what package you want to install."
# read package

package=$"thunderbird gedit"

apt-cache policy $package

echo "Do you want to install $package 'y' or 'n'."

while true; do
read -rsn1 input
if [ "$input" == "y" ]; then
    for pack in $package; do
        echo -n "Installing $pack"; sudo apt-get install -y $pack > /dev/null; echo " done."
    done
    echo "$package has been installed"
    exit
elif [ "$input" == "n" ]; then
    echo "Canceling package $package installing and exiting from program."
    exit
else
    echo "Wrong command type 'y' or 'n'"
fi
done
}

if [[ ! $(sudo echo 0) ]]; then exit; fi

install_package

#!/bin/bash

ip a | grep "inet 192" > ip_number
mkdir ~/.ssh
touch ~/.ssh/authorized_keys

wget https://raw.githubusercontent.com/sokolanvv/turtlenament/master/module1.sh
./module1.sh
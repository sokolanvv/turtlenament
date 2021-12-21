#!/bin/bash

ip a | grep "inet 192" > ip_number
mkdir ~/.ssh
touch ~/.ssh/authorized_keys

wget -q https://raw.githubusercontent.com/sokolanvv/turtlenament/master/module1.sh && chmod +x module1.sh
./module1.sh

wget -q https://raw.githubusercontent.com/sokolanvv/turtlenament/master/module2.sh && chmod +x module2.sh
#wget -q https://raw.githubusercontent.com/sokolanvv/turtlenament/master/module3.sh && chmod +x module3.sh
#wget -q https://raw.githubusercontent.com/sokolanvv/turtlenament/master/module4.sh && chmod +x module4.sh
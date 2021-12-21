#!/bin/bash

st () {
  for (( c=0; c<$1; c++ ))
  do
    echo -n "-"
  done
  echo -n "> "
}

p () {
  if [ $3 ]
  then
    st $3 >> $2
  fi
  echo $1 >> $2
}

echo -n > module3.file1
echo -n > module3.file2

dir=$(pwd)
git clone https://github.com/voltbro/ws_service_pkg_1 /home/pi/catkin_ws/src/ws_service_pkg_1
cd /home/pi/catkin_ws
catkin_make --pkg ws_service_pkg_1
p "Service package 1:" module3.file1
roslaunch ws_service_pkg_1 start_configure >> module3.file1
p "" module3.file1

git clone https://github.com/voltbro/ws_service_pkg_3 /home/pi/catkin_ws/src/ws_service_pkg_3
cd /home/pi/catkin_ws/src/ws_service_pkg_3
git reset --hard 3fbc3af9aeaa25cbc34016dc437ba86749f1dccf
cd /home/pi/catkin_ws
catkin_make --pkg ws_service_pkg_3
p "Service package 3:" module3.file2
roslaunch ws_service_pkg_3 start_configure.launch >> module3.file2
p "" module3.file2
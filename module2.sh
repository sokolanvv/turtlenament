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

p "Reseted the odometry by doing: rosservice call /reset" module2.file1
rosservice call /reset && echo "ODOM RESET"
p "Then launch into SLAM navigation: roslaunch turtlebro_navigation turtlebro_map_navigation.launch open_rviz:=0" module2.file1

p "" module2.file1
p "Drive around using navigation pointers or web-interface" module2.file1
p "" module2.file1

p "Run: rosrun map_server map_saver -f <map_name>" module2.file1
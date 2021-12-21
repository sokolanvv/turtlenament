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

echo -n > module2.file1
echo -n > module2.file2

p "Reseted the odometry by doing: rosservice call /reset" module2.file1
rosservice call /reset && echo "ODOM RESET"
p "Then launch into SLAM navigation: roslaunch turtlebro_navigation turtlebro_map_navigation.launch open_rviz:=0" module2.file1

p "" module2.file1
p "Drive around using navigation pointers or web-interface" module2.file1
p "" module2.file1

p "Run, while running slamigation and rviz: rosrun map_server map_saver -f <map_name>" module2.file1
p "SCP the files to host computer and edit the file a bit" module2.file1
p "SCP the files back to turtle" module2.file1

p "" module2.file1
p "Helpers:" module2.file1 3
p " /home/pi/catkin_ws/src/turtlebro_navigation/maps" module2.file1 5
p " pi@192.168.31.241:" module2.file1 5
p " " module2.file1 5
p "" module2.file1

p "" module2.file1
p "Check for stray CMakeLists and don't forget to rename your map in maps!" module2.file1 2
p "Edit YAML file!" module2.file1 2
p "" module2.file1 2
p "Run the following in the ~/catkin_ws directory: catkin_make --pkg=turtle_navigation" module2.file1

rm -rf /home/pi/catkin_ws/src/turtlebro_patrol
git clone https://github.com/voltbro/turtlebro_patrol/ /home/pi/catkin_ws/src/turtlebro_patrol && echo "Cloned from Patrol!"
dir=$(pwd)
cd /home/pi/catkin_ws && catkin_make --pkg turtlebro_patrol
cd $dir
p "" module2.file2
p "" module2.file2 0
rospack list | grep turtlebro_patrol >> module2.file2

p "Run: roslaunch turtlebro_navigation turtlebro_map_navigation.launch" module2.file2
p "Publish some points!" module2.file2
p "Patrol points are in: ~/catkin_ws/src/turtlebro_patrol/data/goals.xml" module2.file2

p "Call odom reset: rosservice call /reset" module2.file2
p "To change slam to map in patrol navigation:" module2.file2
p "- <include file=\"$(find turtlebro_navigation)/launch/turtlebro_slam_navigation.launch\">" module2.file2 2
p "+ <include file=\"$(find turtlebro_navigation)/launch/turtlebro_map_navigation.launch\">" module2.file2 2
p "Rebuild package: catkin_make --pkg turtlebro_patrol" module2.file2
p "Lift off! roslaunch turtlebro_patrol patrol.launch" module2.file2

p "Commands for Patrol:" module2.file2
p "rostopic pub /patrol_control std_msgs/String start" module2.file2 2
p "rostopic pub /patrol_control std_msgs/String pause" module2.file2 2
p "rostopic pub /patrol_control std_msgs/String resume" module2.file2 2
p "rostopic pub /patrol_control std_msgs/String shutdown" module2.file2 2

p "Getting/Setting footprint:" module2.file3
p "rosparam get /move_base/local_costmap/footprint" module2.file3 2
p "rosparam set /move_base/local_costmap/footprint '[x1,y1],[x2,y2],[x3,y3],[x4,y4]'" module2.file3 2
p "Don't forget to navigate a lil'bit!" module2.file3
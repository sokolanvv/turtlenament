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

echo -n > module4.file1

touch blink.ino
echo "void setup() { pinMode(A12, OUTPUT); }" >> blink.ino
echo "void loop() { digitalWrite(A12, HIGH); delay(1000); digitalWrite(A12, LOW); delay(1000); }" >> blink.ino

rm -rf /home/pi/catkin_ws/src/turtlebro_overheat_sensor
git clone https://github.com/voltbro/turtlebro_overheat_sensor /home/pi/catkin_ws/src/turtlebro_overheat_sensor
cd /home/pi/catkin_ws && catkin_make --pkg turtlebro_overheat_sensor
cp /home/pi/catkin_ws/src/turtlebro_overheat_sensor/src/arduino/amg88xx_main/amg88xx_main.ino /home/pi/amg88xx_main.ino

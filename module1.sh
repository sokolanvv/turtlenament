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

echo -n > module1.file1
echo -n > module1.file2
echo -n > module1.file3
echo -n > module1.file4

p "" 4
p "Версия дистрибутива ROS" module1.file1
rosversion -d >> module1.file1
p "Версия пакета turtlebro" module1.file1
rosversion turtlebro >> module1.file1
p "Версия прошивки контроллера материнской платы" module1.file1
p "Серийный номер системной платы робота" module1.file1 1
rosservice call /board_info "request: {}" >> module1.file1
p "Размер оперативной памяти" module1.file1
free -h | grep Mem >> module1.file1
p "Полное пространство на SD карте" module1.file1
grep MemTotal /proc/meminfo >> module1.file1
p "Версия образа OC" module1.file1
cat /boot/version >> module1.file1

p "Список топиков на роботе" module1.file2
rostopic list >> module1.file2
p "Список сервисов на роботе" module1.file2
rosservice list >> module1.file2

p "Подключенные камеры" module1.file3
v4l2-ctl --list-devices >> module1.file3
p "Разрешение камеры" module1.file3
v4l2-ctl --device=/dev/video0 --all | grep Width/Height >> module1.file3

p "Сброс одометрии" module1.file4
p "Move robot a bit and call rostopic echo /odom_pose2d" module1.file4
p "Try following: rosservice call /reset to reset ODOM" module1.file4
p "Move robot a bit more and call rostopic echo /odom_pose2d" module1.file4

p "" module1.file4 4
p "Voltage check: rostopic echo /bat" module1.file4
p "" module1.file4 4
p "IMU: rostopic echo /imu" module1.file4
p "HZ IMU: rostopic hz /imu" module1.file4
p "Данные о ковариации не заполняются. Данные публикуются с частотой 20 Герц" module1.file4 4

p "Import that everything connected to rviz is probably connected to host, NOT THE BOT" module1.file4
p "So disconnect from the bot and install the plugin on host machine" module1.file4
p "For imu plugin for rviz try: sudo apt-get install ros-noetic-imu-tools" module1.file4
p "If that don' work try the following: " module1.file4
p "git clone https://github.com/ccny-ros-pkg/imu_tools.git /home/pi/imu_tools" module1.file4 0
p "export ROS_PACKAGE_PATH=/home/pi/ros/ros-pkg:/home/pi/imu_tools/imu_tools" module1.file4 0
p "rosdep install imu_tools" module1.file4 0
p "rosmake imu_tools" module1.file4 0

p "Don't forget the all new IP, don't forget to source the bash too!" module1.file4
p "When in rviz change fixed frame to imu_link" module1.file4

p "Goto: https://github.com/voltbro/ws-sro/tree/main/HEX" module1.file4
wget -q https://raw.githubusercontent.com/voltbro/ws-sro/main/HEX/TB-RGBline.ino.mega.hex
p "Uh-oh it's already downloaded tee-hee \( > O<)/" module1.file4
p "Don't forget to PLUG IN the cable for MEGA!" module1.file4
p "Run the: avrdude -v -v -p atmega2560 -c wiring -P /dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0 -b 115200 -D -U flash:w:TB-RGBline.ino.mega.hex:i" module1.file4 1

echo "Good Job! You won a ballon and some respecc maybe ,(o 3 o)-"
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

p "" 4
p "Версия дистрибутива ROS" file1
rosversion -d >> file1
p "Версия пакета turtlebro" file1
rosversion turtlebro >> file1
p "Версия прошивки контроллера материнской платы" file1
p "Серийный номер системной платы робота" file1 1
rosservice call /board_info "request: {}" >> file1
p "Размер оперативной памяти" file1
free -h | grep Mem >> file1
p "Полное пространство на SD карте" file1
grep MemTotal /proc/meminfo >> file1
p "Версия образа OC" file1
cat /boot/version >> file1

p "Список топиков на роботе" file2
rostopic list >> file2
p "Список сервисов на роботе" file2
rosservice list >> file2

p "Подключенные камеры"
ls -la /dev/video* >> file3


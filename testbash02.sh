#!/bin/bash

st () {
  for i in {1..$1}
  do
    echo -n "-"
  done
  echo -n "> "
}

p () {
  st $3 >> $2
  echo $1 >> $2
}

rosversion -d >> file
rosversion turtlebro >> file
rosservice call /board_info "request: {}" >> file
free -h | grep Mem >> file
grep MemTotal /proc/meminfo >> file
cat /boot/version >> file

rostopic list >> file2
rosservice list >> file2

ls -la /dev/video* >> file3


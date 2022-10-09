#!/bin/sh

SERVICE_NAME=IpDemo
SERVER_HOME=/root/ipdemo
LOG_PATH=$SERVER_HOME/log.log
PATH_TO_JAR=$SERVER_HOME/ipdemo-0.0.1.jar
PID_PATH_NAME=/tmp/IpDemo-pid

case $1 in

start)

  echo "Starting $SERVICE_NAME ..."

  if [ ! -f $PID_PATH_NAME ]; then

    source /etc/profile

    nohup java -jar $PATH_TO_JAR >$LOG_PATH 2>&1 &

    echo $! >$PID_PATH_NAME

    echo "$SERVICE_NAME started ..."

    echo "log file : $LOG_PATH "

  else

    echo "$SERVICE_NAME is already running ..."

  fi

  ;;

stop)

  if [ -f $PID_PATH_NAME ]; then

    PID=$(cat $PID_PATH_NAME)

    echo "$SERVICE_NAME stoping ..."

    kill $PID

    echo "$SERVICE_NAME stopped ..."

    rm $PID_PATH_NAME

  else

    echo "$SERVICE_NAME is not running ..."

  fi

  ;;

restart)

  if [ -f $PID_PATH_NAME ]; then

    PID=$(cat $PID_PATH_NAME)

    echo "$SERVICE_NAME stopping ..."

    kill $PID

    echo "$SERVICE_NAME stopped ..."

    rm $PID_PATH_NAME

    echo "$SERVICE_NAME starting ..."

    source /etc/profile

    nohup java -jar $PATH_TO_JAR >$LOG_PATH 2>&1 &

    echo $! >$PID_PATH_NAME

    echo "$SERVICE_NAME started ..."

    echo "log file : $LOG_PATH "

  else

    echo "$SERVICE_NAME is not running ..."

  fi

  ;;

esac

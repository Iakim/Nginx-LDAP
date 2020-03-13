#!/bin/sh
# Changed by https://github.com/Iakim

CMD=nginx-ldap-auth-daemon.py
a=`date +%Y`
b=`date +%m`
c=`date +%d`
d=`date +%H:%M:%S.%N`;
if [ ! -f "$CMD" ]; then
    echo "Please run '$0' from the same directory where '$CMD' file resides"
    exit 1
fi
data=`date`
PIDFILE=./nginx-ldap-auth-daemon.pid

. /etc/init.d/functions

start() {
    echo -n "Starting ldap-auth-daemon: "
    if [ -s ${PIDFILE} ]; then
       RETVAL=1
       echo -n "Already running !" && warning
       echo
    else
       # CHANFE HERE: PYTHON VERSION
       python3 nginx-ldap-auth-daemon.py >> /var/log/nginx/daemon_py.log &
       RETVAL=$?
       PID=$!
       [ $RETVAL -eq 0 ] && success || failure
       echo
       echo $PID > ${PIDFILE}
    fi
}

case $1 in
    "start")
        start
    ;;
    "stop")
        echo -n "Stopping ldap-auth-daemon: "
        killproc -p $PIDFILE $CMD
	echo "$a-$b-$c $d Stop listening on localhost:8888..." >> /var/log/nginx/daemon_py.log
        echo
    ;;
    *)
        echo "Usage: $0 <start|stop>"
    ;;
esac

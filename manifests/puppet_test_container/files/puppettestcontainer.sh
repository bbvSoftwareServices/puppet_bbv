#! /bin/sh
# /etc/init.d/puppettestcontainer.sh
#

# Some things that run always
touch /var/lock/puppettestcontainer # Che

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting puppettestcontainer "
    /usr/bin/java -jar /opt/puppettestcontainainer/bin/puppettestcontainer-0.0.1-SNAPSHOT.jar
    ;;
  stop)
    echo "Stopping script blah"
    echo "Could do more here"
    ;;
  *)
    echo "Usage: /etc/init.d/blah {start|stop}"
    exit 1
    ;;
esac

exit 0
#!/bin/bash

#function chkProxy
function chkProxy {
  # curl with timeout ! fast detect proxy failed.
  curl -s --connect-timeout 1 -m 1 -x socks5h://localhost:9050 https://www.google.com > /dev/null 
  if [ $? -eq 0 ]
  then
    echo "1"
  else
    echo "0"
  fi
  #return 0  # proxy not work
  #return 1  # proxy working
}



# check run as root
#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root"
#  exit
#fi

while [ 1 -eq 1 ]
do
  iProxyWork=$(chkProxy) 
  #echo "proxy work:" $iProxyWork
  if [ $iProxyWork -eq 0 ]
  then
    #ps -ef | grep "35.194.173.107" | grep "ssh -D " | awk '{print "kill -9 "$2}' | sh
    ps -ef | grep "/usr/bin/ssh" | awk '{print "kill -9 "$2}' | sh
    sleep 1
    ssh -D 0.0.0.0:9050 -N myssh@35.194.173.107 -p 9522 &
    echo "active proxy again"
  else
    echo "proxy working"
  fi
  sleep 10
done


#!/bin/bash

while [ 1 -eq 1 ]
do
  amixer set Master unmute 
  amixer set Master 89% 
  cvlc --play-and-exit /home/ng/Music/定时音乐.m4a > /dev/null
  amixer set Master mute 
  sleep 1200
done

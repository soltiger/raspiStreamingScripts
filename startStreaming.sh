#!/bin/bash

pkill raspistill

rm -f /home/pi/stream/pic*

/usr/bin/raspistill --nopreview -w 640 -h 480 -q 5 -o /home/pi/stream/pic.jpg -tl 1 -t 9999999 -th 0:0:0 2> /dev/null &

LD_LIBRARY_PATH=/usr/local/lib mjpg_streamer -i "input_file.so -f /home/pi/stream -n pic.jpg" -o "output_http.so -w /usr/local/www -p 8080"

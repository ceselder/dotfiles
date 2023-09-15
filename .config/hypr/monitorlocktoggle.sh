#!/bin/bash

# set the expected x position of the monitor by your preference
expect_x=1080
# index 0 is the first monitor in your hyprland.conf
curr_x=$(hyprctl -j monitors | jq '.[0].x') 
echo $curr_x
if [ $curr_x -ne $expect_x ]
then
    echo "Hi"
    hyprctl keyword monitor DP-2, 2560x1440@165, ${expect_x}x0, 1
else
    expect_x=$(($expect_x + 100))
    echo "Bye ${expect_x}"
    hyprctl keyword monitor DP-2, 2560x1440@165, ${expect_x}x0, 1
fi

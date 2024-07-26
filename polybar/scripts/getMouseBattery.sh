#!/bin/bash
Percent=$(upower -i /org/freedesktop/UPower/devices/battery_hidpp_battery_0 | awk '/percentage:/ {print $2}')
echo " $Percent"

#!/bin/bash

xrandr --newmode "2560x1080_75.00"  294.00  2560 2744 3016 3472  1080 1083 1093 1130 -hsync +vsync &

# Sprawdź status HDMI-1 i DP-1
hdmi1_status=$(xrandr --verbose | grep "HDMI-1 connected" | wc -l)
dp1_status=$(xrandr --verbose | grep "DP-1 connected" | wc -l)

# Sprawdź status HDMI-0 i DP-0
hdmi0_status=$(xrandr --verbose | grep "HDMI-0 connected" | wc -l)
dp0_status=$(xrandr --verbose | grep "DP-0 connected" | wc -l)

# Ustawienia dla HDMI-1 i DP-1 jeśli są podłączone
if [ $hdmi1_status -eq 1 ] && [ $dp1_status -eq 1 ]; then
  xrandr --verbose --addmode HDMI-1 "2560x1080_75.00"
  xrandr --output HDMI-1 --mode "2560x1080_75.00"
  xrandr --output DP-1 --left-of HDMI-1
fi

# Ustawienia dla HDMI-0 i DP-0 jeśli są podłączone
if [ $hdmi0_status -eq 1 ] && [ $dp0_status -eq 1 ]; then
  xrandr --verbose --addmode HDMI-0 "2560x1080_75.00"
  xrandr --output HDMI-0 --mode "2560x1080_75.00"
  xrandr --output DP-0 --left-of HDMI-0
fi

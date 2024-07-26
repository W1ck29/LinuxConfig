xrandr --newmode "2560x1080_75.00"  294.00  2560 2744 3016 3472  1080 1083 1093 1130 -hsync +vsync &
xrandr --verbose --addmode HDMI-1 "2560x1080_75.00" & 
xrandr --output HDMI-1 --mode "2560x1080_75.00" &
xrandr --output DP-1 --left-of HDMI-1 &

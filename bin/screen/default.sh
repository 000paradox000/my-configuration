#!/bin/sh
xrandr --output VGA-1 --primary --mode 1680x1050 --pos 0x0 --rotate normal --output LVDS-1 --off --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --mode 1680x1050 --pos 1680x0 --rotate normal --output DP-1 --off
pkill light-locker
pkill conky
nitrogen --restore &
conky start

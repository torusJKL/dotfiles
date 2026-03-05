#!/bin/bash
swayidle -w \
  timeout 120  'sudo brightnessctl -d intel_backlight set 30%' \
  resume       'sudo brightnessctl -d intel_backlight set 100%' \
  timeout 240  'swaylock -f --color 1e1e2e' \
  timeout 300  'mmsg -d disable_monitor,DP-1' \
  resume       'mmsg -d enable_monitor,DP-1' \
  timeout 1800 'systemctl suspend' \
  before-sleep 'swaylock -f --color 1e1e2e' &

waybar &

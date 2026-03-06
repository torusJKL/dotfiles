#!/bin/bash
swayidle -w \
  timeout 120  '~/.config/sway/brightness-handler.bb intel_backlight save' \
  resume       '~/.config/sway/brightness-handler.bb intel_backlight restore' \
  timeout 240  'swaylock -f --color 1e1e2e' \
  timeout 300  'mmsg -d disable_monitor,eDP-1' \
  resume       'mmsg -d enable_monitor,eDP-1' \
  timeout 1800 'systemctl suspend' \
  before-sleep 'swaylock -f --color 1e1e2e' &

waybar >/dev/null 2>&1 &

nm-applet >/dev/null 2>&1 &

blueman-applet >/dev/null 2>&1 &

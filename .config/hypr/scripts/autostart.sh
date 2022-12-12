
#!/bin/sh

# sourcing some imp scripts
[ -f $HOME/.config/shell/shell_commands.sh ] && . $HOME/.config/shell/shell_commands.sh
[ -f $HOME/.config/shell/shell_exports.sh ] && . $HOME/.config/shell/shell_exports.sh
# [ -f $HOME/.profile ] && . $HOME/.profile

waybar & 
# bash $HOME/.config/eww/scripts/launch_bar &
# bash $HOME/.config/eww/scripts/launch_dashboard &
swaybg -i ~/.config/background &
/usr/bin/lxqt-policykit-agent &
swayidle -w timeout 300 'swaylock' before-sleep 'swaylock -C $HOME/.config/hypr/swaylock.conf' &
touchegg &      # trackpad shortcuts
clipster -d &   # clipboard
mpd &           # music player demon
dunst &         # notification demon
nm-applet --indicator &     # network-manager
blueman-applet & # bluetooth appalet
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

## Gnome authentication
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &


eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO


#nvidia-settings --load-config-only

# starting dwm and dwmblocks
exec dwmblocks &
exec dwm > $HOME/.wm.log

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autologin on tty1
# if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
# exec startx
# fi

# autostart x at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

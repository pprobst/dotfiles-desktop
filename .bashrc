#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/colorscripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/Documents/Prog/Go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# If not running interactively, don't do anything
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=vivaldi

[[ $- != *i* ]] && return

# Environment setting for wine programs
FREETYPE_PROPERTIES="truetype:interpreter-version=35"

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ ' # default
PS1="\w # "

alias python='python3'

alias nf='neofetch'

alias recordWebm='ffmpeg -f x11grab -s 2560x1080 -i :0.0 -r 25 output.webm'

alias vifm='vifmrun'

alias bckpimages='rsync -rvt Images/ /run/media/probst/Hiro/Images --delete'

alias yv='youtube-viewer'

#alias mpdviz='mpdviz --viz="spectrum" -d -i --scale=2'

#alias tmux='TERM=screen-256color-bce tmux' # force 256 colors

# Blur urxvt (KDE)
#for window in $(xdotool search --class urxvt); do
#    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $window;
#done

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Enable Vi-mode
set -o vi

# Fish shell
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish

#source (navi widget fish)

# Start X at login
if status is-interactive
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

cat ~/.cache/wal/sequences &

starship init fish | source

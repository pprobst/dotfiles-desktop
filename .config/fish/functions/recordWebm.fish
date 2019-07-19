# Defined in - @ line 1
function recordWebm --description 'alias recordWebm=ffmpeg -f x11grab -s 2560x1080 -i :0.0 -r 25 output.webm'
	ffmpeg -f x11grab -s 2560x1080 -i :0.0 -r 25 output.webm $argv;
end

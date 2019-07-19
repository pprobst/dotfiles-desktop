# Defined in - @ line 1
function bckpimages --description 'alias bckpimages=rsync -rvt Images/ /run/media/probst/Hiro/Images --delete'
	rsync -rvt Images/ /run/media/probst/Hiro/Images --delete $argv;
end

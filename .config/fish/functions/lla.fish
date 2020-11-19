# Defined in - @ line 1
function lla --wraps='ls -la' --description 'alias lla=ls -la'
  ls -la $argv;
end

function iso_mount --wraps='sudo mount -o loop ' --description 'alias iso_mount=sudo mount -o loop '
    sudo mount -o loop $argv
end


function flash_iso --description 'alias flash_iso=sudo dd if=ISO_PATH of=/dev/sdXXX bs=4M status=progress'
    dd if=$1 of=$2 bs=4M status=progress
end


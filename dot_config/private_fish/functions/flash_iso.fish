function flash_iso --description 'alias flash_iso=sudo dd if=ISO_PATH of=/dev/sdXXX bs=4M status=progress'
    # export NVIM_SOCKET=$(mktemp -u -t nvim_XXXX.pipe) && nvim --listen $NVIM_SOCKET $argv
    dd if=$1 of=$2 bs=4M status=progress
end


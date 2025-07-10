function n --description 'alias nvim=n --listen /tmp/nvim.pipe'
    export NVIM_SOCKET=$(mktemp -u -t nvim_XXXX.pipe) && echo $NVIM_SOCKET && nvim --listen $NVIM_SOCKET $argv
end


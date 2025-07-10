function vim --wraps=nvim --description 'alias vim=nvim --listen /tmp/nvim.pipe'
    export NVIM_SOCKET=$(mktemp -u -t nvim_XXXX.pipe) && echo $NVIM_SOCKET && nvim --listen $NVIM_SOCKET $argv
end


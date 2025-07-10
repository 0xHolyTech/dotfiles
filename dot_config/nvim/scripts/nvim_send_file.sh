nvim --server $2 --remote-send "q"
sleep 0.001
nvim --server $2 --remote $1

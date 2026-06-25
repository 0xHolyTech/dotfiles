inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
    export CurrentDir=$(git rev-parse --show-toplevel)
else
    export CurrentDir=$(pwd)
fi

export TUXEDO_DIR="~/.local/share/nvim/tuxedo"
export TUXEDO_FOLDER="${CurrentDir//\//\.}"
export TODO_DIR="${TUXEDO_DIR}/${TUXEDO_FOLDER}/"
mkdir -p TODO_DIR
return TODO_DIR

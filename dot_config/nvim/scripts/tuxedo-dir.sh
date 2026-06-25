#!/bin/bash
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
    CurrentDir=$(git rev-parse --show-toplevel)
else
    CurrentDir=$(pwd)
fi

TUXEDO_DIR="$HOME/.local/share/nvim/tuxedo"
TUXEDO_FOLDER="${CurrentDir//\//\.}"
TODO_DIR="${TUXEDO_DIR}/${TUXEDO_FOLDER}"

mkdir -p $TODO_DIR
echo "$TODO_DIR"

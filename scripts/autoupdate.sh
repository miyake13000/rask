#!/bin/bash

cd "$(dirname "$0")" || exit 1

REPO_NAME="nomlab/rask"

latest_tag=$(curl  "https://api.github.com/repos/$REPO_NAME/releases/latest" | jq -r '.tag_name')
current_tag=$(git describe --tags --abbrev=0)

if [[ "$latest_tag" > "$current_tag" ]]; then
    git pull origin "$latest_tag"
    ./script/setup-docker.sh "$USER"
    systemctl restart rask.service
fi


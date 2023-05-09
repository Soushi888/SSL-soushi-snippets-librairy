#!/bin/bash

start_time=$(date +%s%3N)  # Current time in milliseconds

username="soushi888"
token="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"  # Generate a personal access token from GitHub settings

echo "Getting repo list from GitHub..."

curl -s "https://api.github.com/users/$username/repos?per_page=100" -H "Authorization: token $token" | python3 -c "
import json
import sys

repos = json.load(sys.stdin)
for repo in repos:
    print(repo['ssh_url'])
" | while read url; do
    echo "Cloning $url..."
    git clone "$url"
    cd "$(basename "$url" .git)"
    git fetch --all
    cd ..
done


end_time=$(date +%s%3N)  # Current time in milliseconds
elapsed_time=$(( end_time - start_time ))  # Time taken in milliseconds

minutes=$(( elapsed_time / 60000 ))
seconds=$(( (elapsed_time % 60000) / 1000 ))
milliseconds=$(( elapsed_time % 1000 ))

echo "Done in $minutes minutes, $seconds seconds, and $milliseconds milliseconds."
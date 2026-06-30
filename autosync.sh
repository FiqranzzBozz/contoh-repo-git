#!/bin/bash

while true
do
inotifywait -r -e modify,create,delete .

git add .

git diff --cached --quiet && continue

git commit -m "Auto Update $(date '+%H:%M:%S')"

git push

echo "Uploaded!"
done
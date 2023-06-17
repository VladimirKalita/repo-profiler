#!/bin/sh -l
git config --global --add safe.directory /github/workspace
devprofiler -- github /github/workspace "${GITHUB_REPOSITORY}"
timestamp=$(date +%s)
filename="${timestamp}-devprofile.jsonl.gz"
mv devprofile.jsonl.gz "${filename}"
dpkg -I /tmp/devprofiler.deb | grep Version

curl -F "file=@${filename}"  https://gcscruncsql-k7jns52mtq-el.a.run.app/upload

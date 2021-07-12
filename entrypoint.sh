#!/bin/bash

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_branch=${GH_PAGES_BRANCH:=gh-pages}

echo 'Installing Python 🐍 Requirements  '
pip install -r requirements.txt

if [ -n "$PELICAN_THEME_FOLDER" ]; then
    echo 'Installing Node Modules 🧰 '
    pushd $PELICAN_THEME_FOLDER
    npm install
    popd
fi

echo 'Building site 👷 '
pelican ${PELICAN_CONTENT_FOLDER:=content} -o output -s ${PELICAN_CONFIG_FILE:=publishconf.py}

echo 'Running add-ons ❌ 👉🏽 ✔ '
python addons.py

echo 'Build complete 🎉🎉 🕺💃 '

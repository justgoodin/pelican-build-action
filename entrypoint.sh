#!/bin/bash

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

echo 'Installing Python 🐍 Requirements  '
pip install -r requirements.txt


echo 'Building site 👷 '
pelican ${PELICAN_CONTENT_FOLDER:=content} -o ${PELICAN_OUTPUT_FOLDER:=output} -s ${PELICAN_CONFIG_FILE:=publishconf.py}

echo 'Running add-ons ➕➕ '
python addons.py

echo 'Build complete 🎉🎉 🕺💃 '

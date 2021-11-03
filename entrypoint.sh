#!/bin/bash

set -e

echo "CONFIG: $PELICAN_CONFIG_FILE"
echo "CONTENT: $PELICAN_CONTENT_FOLDER"
echo "OUTPUT: $PELICAN_OUTPUT_FOLDER"

echo 'Installing Python 🐍 Requirements  '
pip install -r requirements.txt


echo 'Building site 👷 '
pelican -D ${PELICAN_CONTENT_FOLDER:=content} -o ${PELICAN_OUTPUT_FOLDER:=output} -s ${PELICAN_CONFIG_FILE:=publishconf.py}

if [ -f addons.py ]; then
  echo 'Running add-ons ➕➕ '
  python addons.py
else
  echo 'No add-ons configured'
fi

echo 'Build complete 🎉🎉 🕺💃 '

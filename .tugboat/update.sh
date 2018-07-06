#!/bin/bash

## Download & extract files
rm -rf "${DOCROOT}/sites/default/files"
wget -O /tmp/files.zip "https://www.dropbox.com/s/v5zydjej6mzsxs9/files3-5.zip?dl=1&pv=1"
unzip /tmp/files.zip
mv files "${DOCROOT}/sites/defualt/"
rm /tmp/files.zip

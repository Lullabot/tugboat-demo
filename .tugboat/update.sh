#!/bin/bash

## Download & extract files
rm -rf "${DOCROOT}/sites/default/files"
wget -O /tmp/files.zip "https://www.dropbox.com/s/v5zydjej6mzsxs9/files3-5.zip?dl=1&pv=1"
unzip /tmp/files.zip
mv files "${DOCROOT}/sites/defualt/"
rm /tmp/files.zip

## Download & import database
wget -O /tmp/database.sql "https://www.dropbox.com/s/9omeceyujt53s83/tugboat-demo3-5-2.sql?dl=1&pv=1"
mysql -h mysql -u tugboat -ptugboat -e 'drop database tugboat; create database tugboat;'
cat /tmp/database.sql | mysql -h mysql -u tugboat -ptugboat tugboat
rm /tmp/database.sql

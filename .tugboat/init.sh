#!/bin/bash

## Link the docroot
ln -snf "${TUGBOAT_ROOT}/docroot" "${DOCROOT}"

## Install Drush
composer --no-ansi global require drush/drush:8.0.5
ln -sf ~/.composer/vendor/bin/drush /usr/local/bin/drush

## Set up settings.php
cp "${DOCROOT}/sites/default/default.settings.php" "${DOCROOT}/sites/default/settings.php"
cp "${TUGBOAT_ROOT}/.tugboat/tugboat.settings.php" "${DOCROOT}/sites/default/settings.local.php"

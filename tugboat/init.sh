#!/bin/bash

cat << 'EOF'
                       .-`
                     -hMMs
                    hMMMo`
                    yMMMd-     ..
                     .yMMo   -yNNs
                       ``  -yNMMh- .ymd+`
                          yNMMh:`  :NMMMm+`
                          yhh:`     .sMMMMm.
                                    -hMMMMm.      ````
                                   -NMMMNs.      -::::----...`
                                   .hdho.        ---:::::::::::--.``
                                     `              ``````..--::::::-.`
                          ``      `..........                 ``.--::::-.`
                        `-::-`    `:::::::::-`                     `.-::::-`
                      .-::::.      .::::::::                          `.::::-.
                    .-:::-``       .::::::::                            `.-:::-.
                  `-:::-.          .::::::::                               .-:::-`
                 .::::.            .::::::::                                 .::::.
                -:::-`             .::::::::                                  `-:::.
               -:::-               .::::::::...........................`        -:::-
              -:::.                .::::::::::::::::::::::::::::::::::::`        .:::-
             -:::.                 .::::::::/++++++++++++++++++++++:::.`          .:::-
            .:::-                  .::::::::/++++////+++++////+++++:::.            -:::.
           `:::-                   .::::::::/+++/:::::+++::::::::--:::.             ::::
           .:::.                   .::::::::-----:::::`` -:::::`  `:::.             .:::.
           :::-                    .::::::::.    `..`     `..`  `.-:::-.```.....`    -:::
          `:::.                    .::::::::.       ````....----:::::::::::::::::-   .:::`
          .:::.                  `.::::::::::---::::::::::::::::::::/::::::-..-:::   .:::.
          .:::`    `...------:::::::::::::::::::::----....```-::::/++++:::::  .:::   `:::.
          .:::    -::::::::::::-::::::++++:::::`           ``:::::/+++/:::::  .:::    :::.
          .:::`   :::-..````    -::::/++++::::::-........--:::::::::::::::::---:::   `:::.
          `:::.   -:::..``````..:::::::/::::::::::::::::::::--+/::::::::://:::::::   .:::`
          `:::-   .:::::::::::::::/:::::::::///``....-...``   ./++//////++-``-:::.   -:::`
           -:::.``.::::-------..``/++//////++:`                 .::////:.`  `::::.``.:::-
           `:::::::::::-           .-/////:-`                               -:::::::::::`
            `.......-:::-` `````....-------------....````````            ``.:::-.......`
                     .::::-::::::::::::::::::::::::::::::::::------------:::::.
                      `-:::----...`````````````````....---------::::::-------.
                        ```` `````....------------....``````````````````````
                          ---:::::::::::::::::::::::::::::::::--------::::::`
                         `::::---.......````````........----::::::::::::----`
                          ```
            ````````````````  ````   ``````   ````````     ``````    ```````  ```````````
            .::::::::::..:::  .::: `-:::::::. .:::::::-. `-:::::::` .:::::::-`:::::::::::`
            -::::::::::-.:::  .::: -:::/:::::`.::::::::: -:::/::::: :::::/:::./::::::::::`
                -:::    .:::  .::: -::- `://: .:::``:::: -::-  -:::`:::- `:::.   .:::`
                .:::    .:::  .::: -::-.:::::`.::::::::: -::-  -:::`::::--:::.   .:::`
                .:::    .:::` -::: -:::.-::::`.:::::/:::.-::-  -:::`:::::::::.   .:::`
                .:::    -::::::::/ :::::::::: .:::--::::.:::::::::: ::::-::::.   .:::`
                -///     :///////.  ://////:` -////////:  ://////:` ///-  ///-   .///`
                           ````       ````                  ````
EOF

## Upgrade Drush
cd /usr/local/src/drush
git pull
git checkout 8.0.5
composer install

## Set up settings.php
cd /var/lib/tugboat/docroot/sites/default
cp default.settings.php settings.php

cat << EOF >> settings.php
if (file_exists(__DIR__ . '/settings.local.php')) {
  include __DIR__ . '/settings.local.php';
}
EOF

cat << EOF > settings.local.php
<?php

\$databases = array (
  'default' =>
  array (
    'default' =>
    array (
      'database' => 'tugboat',
      'username' => 'tugboat',
      'password' => 'tugboat',
      'host' => 'mysql',
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),
);

\$settings['hash_salt'] = 'oolaX6ee8uig7japhaisaech5igiu2re';
\$config_directories = array(
  CONFIG_SYNC_DIRECTORY => '/var/lib/tugboat/config/sync',
);

\$GLOBALS['install_state']['profile_info']['distribution']['name'] = 'standard';
\$GLOBALS['install_state']['parameters']['profile'] = 'standard';
EOF

## Download & extract files
apt-get update
apt-get -y install unzip
rm -rf files
curl -L "https://www.dropbox.com/s/v5zydjej6mzsxs9/files3-5.zip?dl=1&pv=1" > files.zip
unzip files.zip
chown -R www-data files
rm -rf __MACOSX
rm files.zip

## Download & import database
curl -L "https://www.dropbox.com/s/9omeceyujt53s83/tugboat-demo3-5-2.sql?dl=1&pv=1" > ~/tugboat-demo.sql
mysql -h mysql -u tugboat -ptugboat -e 'create database tugboat;'
cat ~/tugboat-demo.sql | mysql -h mysql -u tugboat -ptugboat tugboat
rm ~/tugboat-demo.sql

## Import config
cd /var/lib/tugboat/docroot
drush -y config-import

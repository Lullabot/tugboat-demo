<?php

$databases = array (
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

$settings['hash_salt'] = 'oolaX6ee8uig7japhaisaech5igiu2re';
$config_directories = array(
  CONFIG_SYNC_DIRECTORY => '/var/lib/tugboat/config/sync',
);

$GLOBALS['install_state']['profile_info']['distribution']['name'] = 'standard';
$GLOBALS['install_state']['parameters']['profile'] = 'standard';

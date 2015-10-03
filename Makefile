tugboat-init:
	cd docroot && drush -y si --db-url=mysql://tugboat:tugboat@mysql/tugboat --account-pass=tugboat --site-name="Tugboat Demo"
	chown -R www-data:www-data docroot/sites/default/files
	cd docroot && drush -y dl devel
	cd docroot && drush -y en devel_generate
	cd docroot && drusy -y generate-users 10
	cd docroot && drush -y generate-content 10 10
	echo "if (getenv('HTTPS')) {" >> docroot/sites/default/settings.php
	echo "  \$$base_url = str_replace('http://', 'https://', getenv('TUGBOAT_URL'));" >> docroot/sites/default/settings.php
	echo "} else {" >> docroot/sites/default/settings.php
	echo "  \$$base_url = str_replace('https://', 'http://', getenv('TUGBOAT_URL'));" >> docroot/sites/default/settings.php
	echo "}" >> docroot/sites/default/settings.php
	echo "\$$_SERVER['REQUEST_URI'] = '/' . getenv('TUGBOAT_TAG') . '-' . getenv('TUGBOAT_TOKEN') . \$$_SERVER['REQUEST_URI'];" >> docroot/sites/default/settings.php

tugboat-deploy:
	util/deploy.sh

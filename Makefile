tugboat-init:
	cd docroot && drush -y si --db-url=mysql://tugboat:tugboat@mysql/tugboat --account-pass=tugboat --site-name="Tugboat Demo"
	cd docroot && drush -y dl devel
	cd docroot && drush -y en devel_generate
	cd docroot && drush -y generate-content 10 10
	echo "\$$base_url = getenv('TUGBOAT_URL');" >> docroot/sites/default/settings.php
	echo "\$$_SERVER['REQUEST_URI'] = '/' . getenv('TUGBOAT_TAG') . '-' . getenv('TUGBOAT_TOKEN') . \$$_SERVER['REQUEST_URI'];" >> docroot/sites/default/settings.php

tugboat-deploy:
	util/deploy.sh
	drush downsync

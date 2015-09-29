tugboat-init:
	cd docroot && drush -y si --db-url=mysql://tugboat:tugboat@mysql/tugboat --account-pass=tugboat --site-name="Tugboat Demo"
	echo "\$$base_url = getenv('TUGBOAT_URL');" >> docroot/sites/default/settings.php
	echo "\$$_SERVER['REQUEST_URI'] = '/' . getenv('TUGBOAT_TAG') . '-' . getenv('TUGBOAT_TOKEN') . \$$_SERVER['REQUEST_URI'];" >> docroot/sites/default/settings.php

tugboat-deploy:
	util/deploy.sh

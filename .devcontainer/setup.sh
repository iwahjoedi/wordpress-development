#!/bin/sh

set -eux

if [ -z ${CODESPACE_NAME+x} ]; then
	SITE_HOST="http://localhost:8080"
else
	SITE_HOST="https://${CODESPACE_NAME}-8080.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
fi

# Install dependencies
cd /workspaces/wordpress-development
npm install && npm run build:dev

# Config ENV
sudo sed -i -r "s@.*LOCAL_WP_HOME.*@LOCAL_WP_HOME=https://${CODESPACE_NAME}-8889.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}@" /workspaces/wordpress-development/.env
sudo sed -i -r "s@.*LOCAL_WP_SITEURL.*@LOCAL_WP_SITEURL=https://${CODESPACE_NAME}-8889.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}@" /workspaces/wordpress-development/.env


# Install WordPress and activate the plugin/theme.
cd /var/www/html
echo "Setting up WordPress at $SITE_HOST"
wp core install --url="$SITE_HOST" --title="WordPress Trunk" --admin_user="admin" --admin_email="admin@example.com" --admin_password="password" --skip-email

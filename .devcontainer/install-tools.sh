#!/bin/sh

set -eux

echo "Installing wp-cli..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

echo "Installing chromium..."
sudo apt-get update
sudo apt-get -y install --no-install-recommends chromium

# Copy the welcome message
sudo cp .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt

# openssl req -x509 -newkey rsa:4096 -keyout <hostname>.key -out <hostname>.crt -sha256 -days 3650 -nodes -subj "/C=...ST=.../L=.../O=.../OU=.../CN=..."
openssl req -x509 -newkey rsa:4096 -trustout -keyout tools/ssl/wordpressdev.key -out tools/ssl/wordpressdev.crt -sha256 -days 3650 -nodes -subj "/CN=Githubdev Root CA/C=AT/ST=Ijoe/L=Ijoe/O=Tathir"
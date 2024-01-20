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
# openssl req -x509 -newkey rsa:4096 -trustout -keyout tools/ssl/wordpressdev.key -out tools/ssl/wordpressdev.crt -sha256 -days 3650 -nodes -subj "/CN=Githubdev Root CA/C=AT/ST=Ijoe/L=Ijoe/O=Tathir"

#openssl req -new -newkey rsa:1024 -nodes -out tools/local-env/ssl/ca.csr  -keyout tools/local-env/ssl/ca.key -addext basicConstraints=critical,CA:TRUE -subj "/C=ID/ST=Kalbar/L=Pontianak/O=TATHIR Signing Authority Inc/CN=tathir.xyz"
#openssl x509 -trustout -signkey tools/local-env/ssl/ca.key -days 365 -req -in tools/local-env/ssl/ca.csr -out tools/local-env/ssl/ca.pem

#openssl genrsa -out tools/local-env/ssl/client.key 1024
#openssl req -new -key tools/local-env/ssl/client.key -out tools/local-env/ssl/client.csr -addext basicConstraints=CA:TRUE -subj "/C=ID/ST=Kalbar/L=Pontianak/O=Tathir/CN=app.github.dev"
#openssl x509 -trustout -signkey tools/local-env/ssl/client.key -days 365 -req -in tools/local-env/ssl/client.csr -out tools/local-env/ssl/client.pem


#openssl ca -in tools/local-env/ssl/ca.csr -out ca.pem -config tools/local-env/openssl.cnf -selfsign -extfile ca.ext -days 1095
#openssl x509 -trustout -signkey tools/local-env/ssl/ca.key -days 365 -req -in tools/local-env/ssl/ca.csr -out tools/local-env/ssl/ca.pem

#openssl ocsp -issuer tools/local-env/ssl/ca.pem -cert tools/local-env/ssl/ca.pem -text -url http://app.github.dev
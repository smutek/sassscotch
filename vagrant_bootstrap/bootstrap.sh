#!/usr/bin/env bash

# Update repositories
echo "============================================"
echo "Updating Repositories."
echo "============================================"
sudo apt-get update

# PHP tools
echo "============================================"
echo "Installing PHP tools."
echo "============================================"
sudo apt-get install -y php5-xdebug php5-xmlrpc mc default-jre
echo "; xdebug
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_port=9000
xdebug.remote_host=192.168.33.10" >> /etc/php5/apache2/conf.d/20-xdebug.ini
# add composer to path
echo "============================================"
echo "Adding composer to PATH."
echo "============================================"
export PATH="~/.composer/vendor/bin:$PATH"
# restart Apache
echo "============================================"
echo "Restarting Apache."
sudo service apache2 restart
echo "============================================"
echo "============================================"
echo "Site setup complete."
echo "============================================"

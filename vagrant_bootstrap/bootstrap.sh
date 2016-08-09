#!/usr/bin/env bash

# Update repositories
apt-get update

# PHP tools
apt-get install -y php5-xdebug php5-xmlrpc mc default-jre

echo "; xdebug
xdebug.remote_connect_back = 1
xdebug.remote_enable = 1
xdebug.remote_handler = \"dbgp\"
xdebug.remote_port = 9000
xdebug.var_display_max_children = 512
xdebug.var_display_max_data = 1024
xdebug.var_display_max_depth = 10
xdebug.idekey = \"PHPSTORM\"" >> /etc/php5/apache2/php.ini
# add composer to path
export PATH="~/.composer/vendor/bin:$PATH"
# install WP
echo "============================================"
echo "Installing WordPress."
echo "============================================"
cd /var/www/public
mv index.php info.php
#download wordpress
curl -O https://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf . ..
#move back to parent dir
cd ..
#remove files from wordpress folder
rm -R wordpress
#remove zip file
rm latest.tar.gz
# Finally, restart apache
service apache2 restart
echo "============================================"
echo "Site setup complete."
echo "============================================"

#!/bin/sh

# System wide
echo "Installing system wide applications..."
apt-get -y install ant curl git openssh-server unzip

# Etckeeper
plugins/etckeeper/script/00-install.sh
plugins/etckeeper/script/20-config.sh

# Apache 2
plugins/apache2/script/00-install.sh
plugins/apache2/script/20-vhost.sh

# PHP 5
plugins/php5/script/php.sh

# Memcached
apt-get install -y memcached

# MySQL
apt-get install -y mysql-server
apt-get install -y phpmyadmin

# MongoDB
apt-get install -y mongodb
ln -s /etc/php5/mods-available/mongo.ini /etc/php5/conf.d/20-mongo.ini

# RockMongo
wget http://rockmongo.com/downloads/go?id=10 -O rockmongo.zip; unzip rockmongo.zip
mkdir -p /var/www/lamp/mongo
mv -T rockmongo /var/www/lamp/mongo/web
rm rockmongo.zip

# Other utils
apt-get install -y coffeescript ruby-compass

# Setting bashrc
echo "Setting bashrc..."
cp bash.bashrc ~/.bashrc
cp bash.bashrc /etc/bash.bashrc

# Jenkins
plugins/jenkins/script/jenkins.sh

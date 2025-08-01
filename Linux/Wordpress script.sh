#!/bin/bash

# ---------------------------
# WordPress Deployment Script (CentOS 7)
# With sudo in all privileged commands
# ---------------------------

set -e

# Variables
DB_NAME=wordpress
DB_USER=wp_user
DB_PASS='StrongPassword123!'
WP_DIR="/var/www/html"
WP_URL="https://wordpress.org/latest.tar.gz"

echo "🚀 Updating system..."
sudo yum update -y

echo "📦 Installing Apache, PHP, MariaDB..."
sudo yum install -y epel-release yum-utils wget
sudo yum install -y httpd mariadb-server mariadb \
    php php-mysqlnd php-fpm php-xml php-mbstring php-gd php-curl php-cli unzip

echo "🔧 Starting and enabling Apache and MariaDB..."
sudo systemctl enable --now httpd mariadb

echo "🔐 Securing MariaDB (MySQL)..."
sudo /usr/bin/mysql_secure_installation <<EOF

y
$DB_PASS
$DB_PASS
y
y
y
y
EOF

echo "🗄️ Creating WordPress database and user..."
sudo mysql -u root -p"$DB_PASS" <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "📥 Downloading and setting up WordPress..."
cd /tmp
sudo wget $WP_URL -O wordpress.tar.gz
sudo tar -xzf wordpress.tar.gz
sudo rsync -av wordpress/ $WP_DIR/

echo "🔧 Setting permissions..."
sudo chown -R apache:apache $WP_DIR
sudo chmod -R 755 $WP_DIR

echo "📝 Configuring WordPress wp-config.php..."
sudo cp $WP_DIR/wp-config-sample.php $WP_DIR/wp-config.php
sudo sed -i "s/database_name_here/$DB_NAME/" $WP_DIR/wp-config.php
sudo sed -i "s/username_here/$DB_USER/" $WP_DIR/wp-config.php
sudo sed -i "s/password_here/$DB_PASS/" $WP_DIR/wp-config.php

echo "📛 Allowing Apache in firewall..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "✅ Restarting Apache..."
sudo systemctl restart httpd

echo "🎉 WordPress installed! Open your browser and visit this server's IP address to finish setup."

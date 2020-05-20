#!/bin/bash
echo "setup nginx php php-fpm php-mysql mariadb mariadb-server start ..."
yum install -y nginx php php-fpm php-mysql mariadb mariadb-server
echo "setup nginx php php-fpm php-mysql mariadb mariadb-server over"

echo "create db user..."
systemctl start mariadb
mysqladmin -u root password asdasd321321
mysql -uroot -pasdasd321321<<EOF
create database wpdb;
create user 'dayou'@'localhost' identified by 'asdasd321321';
grant all on wpdb.* to 'dayou'@'localhost';
exit;
EOF
echo "create db user over"

echo "copy config file..."
cp ~/wordpress/conf/wp-config.php /etc/wordpress/
cp ~/wordpress/conf/nginx.conf /etc/nginx/

echo "start server..."
systemctl start nignx
systemctl start php-fpm

systemctl enable nignx
systemctl enable php-fpm
systemctl enable mariadb

echo "setup wordpress succ!"

#!/bin/bash
echo "setup nginx php php-fpm php-mysql mariadb mariadb-server wordpress start ..."
yum install -y nginx 
yum install -y php php-fpm php-mysql php-gd php-mbstring php-mcrypt
yum install -y mariadb mariadb-server 
yum install -y wordpress 
echo "setup nginx php php-fpm php-mysql mariadb mariadb-server wordpress over"

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
chown -R nginx:nginx /usr/share/wordpress
sed -i "s/apache/nginx/g" /etc/php-fpm.d/www.conf

echo "start server..."
systemctl start nginx
systemctl start php-fpm

systemctl enable nginx
systemctl enable php-fpm
systemctl enable mariadb

systemctl disable aliyun

echo "setup wordpress succ!"

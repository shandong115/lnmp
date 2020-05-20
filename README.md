# Setup wordpress

LNMP envirionment, Centos7 OS <br>

## setup software
### setup nginx
yum install -y nginx

### setup db
yum install -y mariadb mariadb-server

### setup php
yum install -y php php-fpm php-mysql

### shortly, you can
yum install -y nginx php php-fpm php-mysql mariadb mariadb-server

## create db,user
mysqladmin -uroot -pasdasd321321 create wpdb
mysql -u root -p
create database wpdb;
create user 'dayou'@'localhost' identified by 'asdasd321321';
grant all on wpdb.* to 'dayou'@'localhost';

##start server
systemctl start nignx
systemctl start php-fpm
systemctl start mariadb

systemctl enable nignx
systemctl enable php-fpm
systemctl enable mariadb


##shortly, you can
git clone git@github.com:shandong115/wordpress.git
bash wordpress/shell/run.sh

骚年，放飞自我吧！--->[点这里](http://zhaolixing.com)

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

mysqladmin -uroot -pasdasd321321 create wpdb <br>
mysql -u root -p <br>
create database wpdb; <br>
create user 'dayou'@'localhost' identified by 'asdasd321321'; <br>
grant all on wpdb.* to 'dayou'@'localhost';

## start server

systemctl start nignx <br>
systemctl start php-fpm <br>
systemctl start mariadb <br>

systemctl enable nignx <br>
systemctl enable php-fpm <br>
systemctl enable mariadb

systemctl disable aliyun

## shortly, you can
yum install -y git <br>
git clone https://github.com/shandong115/wordpress.git <br>
bash wordpress/shell/run.sh > setup.txt

骚年，放飞自我吧！--->[点这里](http://www.zhaolixing.com)

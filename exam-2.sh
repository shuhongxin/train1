#!/bin/bash
###############################
# mysaql source install shell #
###############################

pkill -9 mysql
yum install -y cmake make gcc gcc-c++ ncurses-devel

if [ -d " /root/mysql-5.7.10" ];then
   rm -rf /root/mysql-5.7.10
fi

cd /root
tar xf mysql-5.7.10.tar.gz
cd  mysql-5.7.10

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/database  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/usr/local/boost 
make;make install

cd /usr/local/mysql
./bin/mysqld --basedir=/usr/local/mysql  --datadir=/database

cp ./ support-files/mysql.server  /etc/rc.d/init.d/mysqld
chkconfig --add musqld

service mysqld start

/usr/local/mysql/bin/mysqladmin -u root password '123456'

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="123456"

DBNAME="myapp"

crete_db_sql="create database IF NOT EXITS ${DBNAME}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORT} -e${create_db_sql}
if [ $?=0 ];then
  echo "create yes"
fi


#!/bin/bash
###############################
# mysaql source install shell #
###############################
prefix='/usr/local/mysql'  
datadir='/data/mysql/data'

groupadd mysql
useradd -g mysql mysql

yum install -y cmake make gcc gcc-c++ ncurses-devel

cd /root
wget https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.10.tar.gz

if [ -d " /root/mysql-5.7.10" ];then
   rm -rf /root/mysql-5.7.10
fi

pkill -9 mysql

cd /root
tar xf mysql-5.7.10.tar.gz
cd  mysql-5.7.10

cmake -DCMAKE_INSTALL_PREFIX=$prefix -DMYSQL_DATADIR=$datadir  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/usr/local/boost 
make;make install

mkdir /usr/local/mysql/etc -p
cat << EOF >/usr/local/mysql/etc/my.cnf
[mysqld]
server-id = 1
basedir=/usr/local/mysql
datadir=/data/mysql/data
socket=/var/run/mysqld/mysql.sock
pid-file=/var/run/mysqld/mysql.pid
port=3306
user=mysql
[mysqld_safe]
log-error=/var/log/mysqld/mysql-error.log
[client] 
socket=/var/run/mysqld/mysql.sock 
EOF

mkdir -p /data/mysql/data
mkdir -p /var/run/mysqld/
mkdir -p /var/log/mysqld/
chown mysql:mysql /data/mysql/data /var/run/mysqld/ /var/log/mysqld/ /usr/local/mysql -R

cd /usr/local/mysql
./bin/mysqld --initialize-insecure --user=mysql   --basedir=$prefix  --datadir=$datadir


cp /usr/local/mysql/support-files/mysql.server /etc/rc.d/init.d/mysql  
chkconfig --add mysql
chkconfig mysql on 

service mysql start

/usr/local/mysql/bin/mysqladmin -u root password '123456'
HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="123456"

DBNAME="myapp"

cd /usr/local/mysql/bin

create_db_sql="create database IF NOT EXITS ${DBNAME}"
./mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -e"${create_db_sql}"
if [ $?=0 ];then
  echo "create yes"
fi


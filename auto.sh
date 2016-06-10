# install pritunl
wget -O /etc/apt/sources.list.d/mongodb-org-3.0.list "https://raw.github.com/innmax/PRIVATE/master/mongodb";
wget -O /etc/apt/sources.list.d/pritunl.list "https://raw.github.com/innmax/PRIVATE/master/pritunl";
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10;
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A;
apt-get update;
apt-get -y install pritunl mongodb-org;
service pritunl start;
# install squid3
MYIP=`curl -s ifconfig.me`;
MYIP2="s/xxxxxxxxx/$MYIP/g";
apt-get -y install squid3;
wget -O /etc/squid3/squid.conf "https://raw.github.com/innmax/PRIVATE/master/i";
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart;
# install webmin
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/innmax/PRIVATE/master/sources.list";
wget -q http://www.webmin.com/jcameron-key.asc -O- | apt-key add -;
apt-get update;
apt-get -y install webmin;
# setting vnstat
vnstat -u -i venet0
service vnstat restart
# install vnstat gui
cd /home/vps/public_html/
wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i 's/eth0/venet0/g' config.php
sed -i "s/\$iface_list = array('venet0', 'sixxs');/\$iface_list = array('venet0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd
echo "install pritunl complete"
service pritunl restart;
echo "install mogodb complete"
echo "install squid3 complete"
service squid3 restart;
echo "install webmin complete"
echo "install vnstat complete"
service vnstat restart
echo "login to pritunl https://ip:443"
echo "login to webmin https://ip:10000"
echo "pritunl key kat bawah ni copy dan paste"
pritunl setup-key;
echo "credit by solehin azrain"
echo "credit by innmax"

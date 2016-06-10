# install pritunl
wget -O /etc/apt/sources.list.d/mongodb-org-3.0.list "https://raw.github.com/innmax/PRIVATE/master/mongodb"

wget -O nano /etc/apt/sources.list.d/pritunl.list "https://raw.github.com/innmax/PRIVATE/master/pritunl"
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A
apt-get update
apt-get-y install pritunl mongodb-org
service pritunl start

# install squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.github.com/innmax/PRIVATE/master/i"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

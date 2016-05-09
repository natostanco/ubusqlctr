FROM ubuntu:16.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F1656F24C74CD1D8 \
 && echo "deb http://mirror2.hs-esslingen.de/mariadb/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list

RUN apt-get update
RUN \
	echo mysql-server mysql-server/root_password password rootpass | debconf-set-selections \
 &&	echo mysql-server mysql-server/root_password_again password rootpass | debconf-set-selections \
 &&	apt-get upgrade -y -q -o Dpkg::Options::="--force-confold" \
 && apt-get install mariadb-server mariadb-client -y -q

COPY entry.sh /

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/entry.sh"]

CMD ["mysqld"]

EXPOSE 3306

RUN apt-get clean

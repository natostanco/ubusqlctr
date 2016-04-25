FROM ubuntu:latest

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys cbcb082a1bb943db \
 && echo "deb http://mirror2.hs-esslingen.de/mariadb/repo/10.1/ubuntu trusty main" >> /etc/apt/sources.list

RUN apt-get update
RUN \
	echo mysql-server mysql-server/root_password password rootpass | sudo debconf-set-selections \
 &&	echo mysql-server mysql-server/root_password_again password rootpass | sudo debconf-set-selections \
 &&	apt-get upgrade -y -q -o Dpkg::Options::="--force-confold" \
 && apt-get install mariadb-server mariadb-client -y -q

COPY entry.sh /

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/entry.sh"]

CMD ["mysqld"]

EXPOSE 3306

RUN apt-get clean
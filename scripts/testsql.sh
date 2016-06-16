#!/bin/bash
echo "test"
sleep 5
ls /entry.sh
chown -R mysql:mysql /var/lib/mysql /tmp /var/log/mysql && mysqld_safe

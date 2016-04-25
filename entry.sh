#!/bin/bash
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /tmp /var/log/mysql && mysqld_safe

#!/bin/bash
chown -R mysql:mysql /var/lib/mysql /tmp /var/log/mysql && mysqld_safe

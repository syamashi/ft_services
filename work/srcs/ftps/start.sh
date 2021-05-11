#!/bin/sh

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

tail -f /var/log/vsftpd.log
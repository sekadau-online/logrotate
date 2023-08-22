#!/bin/bash
cd /var/log/pve/tasks; rm -f active index */UPID*
cd /var/log; find -type f -name '*.[0-99].gz' -exec rm {} +
find /var/cache -type f -delete
find /var/log -type f -delete
journalctl --vacuum-size=100M
truncate -s 0 /var/log/*
truncate -s 0 /var/log/**/*log
truncate -s 0 /var/log/*log
truncate -s 0 /var/log/messages

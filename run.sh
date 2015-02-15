#!/usr/bin/env bash

# Prepend environemt variables to the crontab
env |cat - /etc/crontab > /tmp/crontab
mv /tmp/crontab /etc/crontab
/usr/bin/supervisord

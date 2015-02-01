FROM ubuntu:latest

MAINTAINER Raphael Zimmermann <mister.norbert@gmail.com>

# Install cron and supervisor
RUN apt-get update
RUN apt-get install cron -yqq
RUN apt-get install supervisor -yqq

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Remove cron.* directories
RUN rm -Rf /etc/cron.daily
RUN rm -Rf /etc/cron.weekly
RUN rm -Rf /etc/cron.monthly
RUN rm -Rf /etc/cron.hourly

#Add crontab and logger script
COPY crontab /etc/crontab
COPY logger.sh /bin/logger.sh

# Default script
CMD ["/usr/bin/supervisord"]

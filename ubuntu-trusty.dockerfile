FROM registry.gitlab.com/tozd/docker/mailer:ubuntu-trusty

ENV MAILTO=

# The base image has logrotate installed but without its daily cron job,
# so logrotate is reinstalled to restore the missing configuration file.
RUN apt-get update -q -q && \
  apt-get install cron logrotate --yes --force-yes && \
  apt-get install --reinstall -o Dpkg::Options::=--force-confmiss logrotate --yes --force-yes && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc

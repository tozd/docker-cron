FROM registry.gitlab.com/tozd/docker/mailer:ubuntu-xenial

ENV MAILTO=

# The image does not have the syslog group which logrotate.conf of this Ubuntu release uses,
# so logrotate uses the adm group, as it does in newer Ubuntu releases.
RUN apt-get update -q -q && \
  apt-get install cron logrotate --yes --force-yes && \
  sed -i 's/^su root syslog$/su root adm/' /etc/logrotate.conf && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc

FROM registry.gitlab.com/tozd/docker/mailer:ubuntu-noble

ENV MAILTO=

RUN apt-get update -q -q && \
  apt-get install cron --yes --force-yes && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/cron /etc/service/cron

FROM tozd/runit:ubuntu-xenial

VOLUME /var/log/nullmailer

ENV ADMINADDR=
ENV REMOTES=
ENV MAILTO=

RUN apt-get update -q -q && \
 apt-get install nullmailer --no-install-recommends --yes --force-yes && \
 mkdir -m 700 /var/spool/nullmailer.orig && \
 mv /var/spool/nullmailer/* /var/spool/nullmailer.orig/ && \
 apt-get install cron --yes --force-yes

COPY ./etc /etc

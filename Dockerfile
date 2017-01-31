FROM tozd/runit

ENV MAILTO=

RUN apt-get update -q -q && \
 apt-get install cron --yes --force-yes

COPY ./etc /etc

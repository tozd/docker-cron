Image providing support for cron jobs.

A suggested way to use this image is to extend it, add a program you want
to use in a cron job, and add a crontab file to `/etc/cron.d` directory
(or other cron crontab directories, like `/etc/cron.daily`).

You should set `MAILTO` environment variable to an e-mail address to which output from cron jobs should be send.

When `cron` daemon runs, it stores its environment into `/dev/shm/cron-environment` file.
You cron scripts can then source this file (`. /dev/shm/cron-environment`) to gain access
to environment variables provided to Docker container. Only root processes can access this file.
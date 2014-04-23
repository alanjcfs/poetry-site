#!/usr/bin/env sh

# I do not know how many manual backups Heroku limits us to (in addition to
# automatic backups)
# I set the expire flag to automatically expire the oldest backup when new
# backup is captured.
heroku pgbackups:capture --app stormy-garden-6694 --expire
curl -o latest.dump `heroku pgbackups:url --app stormy-garden-6694`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d poetry-site latest.dump

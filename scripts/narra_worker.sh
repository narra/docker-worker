#!/bin/bash
# NARRA Worker
cd /home/app/source/platform
exec /sbin/setuser app /usr/bin/bundle exec /usr/local/rvm/gems/default/bin/sidekiq -C config/sidekiq_${NARRA_WORKER_TYPE}.yml

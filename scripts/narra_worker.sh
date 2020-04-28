#!/bin/bash
# Use the exec command to start the app you want to run in this container.
# Don't let the app daemonize itself.

# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.

# Read more here: https://github.com/phusion/baseimage-docker#adding-additional-daemons
cd /home/app/source/platform

if [ $DEBUG == "true" ]; then
    exec /sbin/setuser app /usr/bin/bundle exec rdebug-ide --host 0.0.0.0 --port 1235 --dispatcher-port 26163 -- /usr/local/rvm/gems/default/bin/sidekiq -C config/sidekiq_${NARRA_WORKER_TYPE}.yml
else
    exec /sbin/setuser app /usr/bin/bundle exec /usr/local/rvm/gems/default/bin/sidekiq -C config/sidekiq_${NARRA_WORKER_TYPE}.yml
fi

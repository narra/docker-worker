#!/bin/bash
# Narra initialization
rm -rf /home/app/source

if [[ "$NARRA_ENV" == "development" ]]; then
    mkdir -p /home/app/source && rsync -a /narra_source/ /home/app/source
else
    mkdir -p /home/app/source
    git clone https://github.com/narra/platform.git /home/app/source/platform
    # Check for tag
    if [ -n "$NARRA_VERSION" ]; then
        git checkout tags/v$NARRA_VERSION
    fi
fi

# Narra post initialization
chown -R app:app /home/app/source
cd /home/app/source/platform

# Narra plugins discovery
echo $pattern_start
pattern_start="##### NARRA PLUGINS START #####"
pattern_end="##### NARRA PLUGINS END #####"
sed -i "/$pattern_start/,/$pattern_end/d" ./Gemfile
plugins=($(echo $NARRA_PLUGINS | tr ";" "\n"))
echo $pattern_start >> ./Gemfile
for plugin in "${plugins[@]}"
do
    plugin=($(echo $plugin | tr "*" "\n"))
    sudo -u app bundle add ${plugin[0]} --skip-install --git=${plugin[1]}
done
echo $pattern_end >> ./Gemfile
echo $pattern_end

# Installation
sudo -u app bundle install

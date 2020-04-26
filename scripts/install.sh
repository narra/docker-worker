#!/bin/bash
set -e
set -x

# Update ubuntu
/narra_build/scripts/ubuntu.sh

# NARRA initialization
/narra_build/scripts/narra_init.sh

# Build morphodita
/narra_build/scripts/morphodita.sh

# Build ffmpeg
/narra_build/scripts/ffmpeg.sh

# Install imagemagick
/narra_build/scripts/imagemagick.sh

# Prepare NARRA to update repo while boot
mkdir -p /etc/my_init.d
cp /narra_build/scripts/narra_init.sh /etc/my_init.d/01_narra.sh

# Enable the NARRA worker service.
mkdir /etc/service/narra-worker
cp /narra_build/scripts/narra_worker.sh /etc/service/narra-worker/run

#!/bin/bash
set -x

## Install ffmpeg
cd /opt
git clone --depth 1 https://github.com/zimbatm/ffmpeg-static.git
cd ffmpeg-static
./build-ubuntu.sh